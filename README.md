OCAS International SIS Integration Guide
========================================

Table of Contents
-----------------

* [Document Revisions](#overview)
  * [Change History](#change-history)
* [Overview](#overview)
* [Coltrane Standard](#coltrane-standard)
* [Getting Started](#getting-started)
* [Default Values](#default-values)
* [Sample](#sample)
* [XML](#xml)
* [JSON (sorta)](#json-sorta-)
* [Requirements](#requirements)

Document Revisions
------------------

| Version      | Editor           |
| ------------ | ---------------- |
| 2.0.0-beta.1 | Michael Aldworth |

### Change History ###

#### 2.0.0-beta.1 ####

* Add New Documentation

Overview
--------

This document will help you integrate your SIS system with the OCAS International
System.

International SISAPI
---------------------

All interaction with the OCAS International System (OIS) will be done through the
SISAPI. The SISAPI is secured with the OpenId Protocol. In order to receive data
from the HTTP Endpoint, each call will need to be passed a Bearer Token in the
Authorization Header. Please see the [Authentication and Authorization]() section
to learn how to retrieve a Bearer Token. If you are using the OCAS Supplied
[Sender Client]() or [Receiver Client](), we have taken care of the heavy lifting
of acquiring a Bearer Token.

### SIS Environments ###

OCAS will provide an environment for testing/integration.

Partner(s) can start to integrate with the EXT environment.

| Environment | Endpoint Info                                         |
| ----------- | ----------------------------------------------------- |
| EXT         | https://\<provided-in-separate-documentation>/swagger |
| PROD        | https://\<provided-in-separate-documentation>/swagger |

### Endpoints ###

Accessing the Swagger URL mentioned in the previous section will present you with
a user friendly grouping of REST Api Functionality

1. Applicants
1. Diagnostics
1. Events

Table below lists the actions that can be made from each controller and their access
limitation.

|                 | Method | Access    | Relative Path                               |
| --------------- | ------ | --------- | ------------------------------------------- |
| **Applicants**  | PUT    | Protected | /v1/api/applicants/{number}/college-details |
| **Diagnostics** | GET    | Public    | /v1/api/diagnostics/servertime              |
|                 | GET    | Public    | /v1/api/diagnostics/logging                 |
|                 | GET    | Public    | /v1/api/diagnostics/database                |
|                 | GET    | Protected | /v1/api/diagnostics/authorization           |
| **Events**      | GET    | Protected | /v1/api/events/peek                         |
|                 | PUT    | Protected | /v1/api/events/{id}/ack                     |

Accessing one of the public endpoints will get respective response back. But if
you access one of the Protected endpoints, you will get an 'Authorization denied'
response.

```json
{
  "message": "Authorization has been denied for this request."
}
```

Please see the [Authentication and Authorization]() section.


#### Events ####

These endpoints (peek and ack) are used to keep track of all events that OIS sends
to the Partner.

**Source (OIS)** -> **Destination (Partner)**

##### GET /v1/api/events/peek #####

Receive a list of all un-acked events (ordered by EventId).

| Url Query Parameters | Value                                        |
| -------------------- | -------------------------------------------- |
| count                | number greater than 0. Max is 500 at a time. |

**_Example Request:_**
   ```HTTP
   GET /v1/api/events/peek?count={number} HTTP/1.1
   Host: <ocas-sis-api-environment>
   Content-Type: application/json
   Authorization: Bearer <token received from identity server>
   Cache-Control: no-cache
   ```

**_Example Response:_**

```json
[
  // SisInboundEvent
  {
    "id": 1,
    "eventInfo":
    {
      "action": "SomeEventTitle",
      "data": { ... }
    }
  },
  // SisInboundEvent
  {
    "id": 4,
    "eventInfo":
    {
      "action": "AnotherEventTitle",
      "data": { ... }
    }
  },
  // SisInboundEvent
  {
    "id": 5,
    "eventInfo":
    {
      "action": "CouldBeSameEventTitle",
      "data": { ... }
    }
  }
]
```

In this example, you can see we have 3 [SisInboundEvents](#sisinboundevent).

##### /v1/api/events/{id}/ack #####

Todo

Objects
-------

### SisInboundEvent ###

| Property  | Type                  | Comment                                                            |
| --------- | --------------------- | ------------------------------------------------------------------ |
| id        | number                | unique number, should always be processed from smallest to largest |
| eventInfo | [SisEvent](#sisevent) |                                                                    |

```JSON
{
  "id": 0,
  "eventInfo": { ... }
}
```

### SisEvent ###

| Property | Type                                        |
| -------- | ------------------------------------------- |
| action   | [SisInboundEventType](#sisinboundeventtype) |
| data     | Varies based on the Action                  |

**_Example:_**

```JSON
{
  "action": "SomeEvent",
  "data": { ... }         // Varies based on SisInboundEventType
}
```

### Application ###

| Property   | Type                                           |
| ---------- | ---------------------------------------------- |
| id         | number                                         |
| number     | string (min 1, max 20)                         |
| created    | ISO 8601 Date Formatted String                 |
| applicant  | [Applicant](#applicant)                        |
| selections | Array of [ProgramSelection](#programselection) |

Example: See [Appendix: Example 1](#example-1)

### Term ###

| Property         | Type                                                       |
| ---------------- | ---------------------------------------------------------- |
| applicationCycle | number ([ApplicationCycleLookup](#applicationcyclelookup)) |
| code             | string ([TermLookup](#termlookup))                         |
| startDate        | date string in format `yyyy-MM-dd`                         |
| endDate          | date string in format `yyyy-MM-dd`                         |

**_Example:_**

```JSON
{
  "applicationCycle":2020,
  "code":"fall",
  "startDate":"2019-08-01",
  "endDate":"2019-11-30"
}
```

Lookups
-------

### SisInboundEventType ###

| Key                  | Data Object Type            |
| -------------------- | --------------------------- |
| ApplicationSubmitted | [Application](#application) |

### ApplicationCycleLookup ###

4 Digit Year (eg. 2016, 2024)

[Latest Db Export](lookups/ApplicationCycles.csv)

### TermLookup ###

Each application cycle will have these 3 codes that correspond to
to each year. So a code + year combo, would give us a unique way to
represent a time an intake is being offered.

| Code   |
| ------ |
| fall   |
| winter |
| spring |

### Country and Provinces Lookups ###

[Latest Db Export](lookups/CountriesAndProvinces.csv)

Appendix
--------

### Example 1 ###

```JSON
{
   "Action":"ApplicationSubmitted",
   "Data":{
      "Id":"72898729-5bc9-e711-a8f0-18dbf25a03ba",
      "Number":"X1485139",
      "Applicant":{
         "Id":"bd93d2be-a5fe-4473-99bb-aeb9a3be8804",
         "Number":"X1185734",
         "Version":2,
         "Created":"0001-01-01T00:00:00",
         "LegalName":{
            "FirstName":"Dion",
            "MiddleNames":[

            ],
            "LastName":"Grady",
            "Prefix":null,
            "Suffix":null
         },
         "DateOfBirth":"1939-06-05",
         "CanadianStatus":"study",
         "PrimaryCitizenshipCountry":null,
         "FullLegalName":"Dion Torey Jeanie Uriel Monserrate Naomi Grady",
         "CasualNames":[

         ],
         "Gender":"female",
         "MailingAddress":{
            "Street":"179 Jacinthe Corner",
            "Apartment":"2371",
            "City":"Port Danyka",
            "Province":null,
            "Country":"RE",
            "PostalCode":"37492-0665"
         },
         "CurrentAddress":null,
         "Phones":[
            {
               "Type":"other",
               "Number":"267.362.7111",
               "Ext":null
            },
            {
               "Type":"other",
               "Number":"1-776-635-7713",
               "Ext":null
            },
            {
               "Type":"other",
               "Number":"297.745.9767",
               "Ext":null
            }
         ],
         "Emails":[
            "Dion25@mailinator.com"
         ],
         "EmergencyContact":{
            "Name":"Ellsworth Morissette",
            "Phone":{
               "Type":"home",
               "Number":"496-216-4555",
               "Ext":null
            },
            "Email":"Ellsworth.Morissette21@mailinator.com",
            "Relationship":"eius",
            "FirstLanguage":"am"
         },
         "Credentials":[
            {
               "SchoolType":"college",
               "SchoolName":"velit-nobis-quod",
               "Country":"WS",
               "ProgramName":null,
               "Status":"InProgress",
               "CompletionDate":"2015-10-24",
               "CredentialType":null
            },
            {
               "SchoolType":"secondary",
               "SchoolName":"neque-quisquam-quo",
               "Country":"EE",
               "ProgramName":"optio",
               "Status":"Completed",
               "CompletionDate":"2015-09-01",
               "CredentialType":"secondary-other"
            }
         ],
         "Proficiencies":[
            {
               "Type":"cael",
               "OtherName":null,
               "Score":"31",
               "CompletionDate":"2016-05-10",
               "SubScores":[
                  {
                     "Type":"writing",
                     "Score":"13"
                  },
                  {
                     "Type":"reading",
                     "Score":"47"
                  },
                  {
                     "Type":"speaking",
                     "Score":"82"
                  },
                  {
                     "Type":"listening",
                     "Score":"38"
                  }
               ]
            },
            {
               "Type":"cefr",
               "OtherName":null,
               "Score":"72",
               "CompletionDate":"2017-01-01",
               "SubScores":[

               ]
            }
         ]
      },
      "Selections":[
         {
            "Term":{
               "ApplicationCycle":2020,
               "Code":"fall",
               "StartDate":"2019-08-01",
               "EndDate":"2019-11-30"
            },
            "Program":{
               "Code":"TST1ESL2",
               "Title":"ESL Program 2",
               "Credential":"other",
               "InternationalProgramType":"Esl"
            },
            "CampusPreference":null,
            "ChoiceNumber":-1
         },
         {
            "Term":{
               "ApplicationCycle":2019,
               "Code":"spring",
               "StartDate":"2019-04-01",
               "EndDate":"2019-07-31"
            },
            "Program":{
               "Code":"TST1D1",
               "Title":"Diploma 1",
               "Credential":"diploma",
               "InternationalProgramType":"Normal"
            },
            "CampusPreference":null,
            "ChoiceNumber":1
         }
      ],
      "Created":"2017-11-14T16:45:04.3709696Z"
   }
}
```