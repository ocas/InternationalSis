OCAS International SIS Integration Guide
========================================

Table of Contents
-----------------

- [OCAS International SIS Integration Guide](#ocas-international-sis-integration-guide)
    - [Table of Contents](#table-of-contents)
    - [Document Revisions](#document-revisions)
        - [Change History](#change-history)
            - [1.0.3](#103)
            - [1.0.2](#102)
            - [1.0.1](#101)
            - [1.0.0](#100)
    - [Overview](#overview)
    - [International SISAPI](#international-sisapi)
        - [SIS Environments](#sis-environments)
        - [Endpoints](#endpoints)
            - [PUT /api/v1/applicants/{number}/college-details](#put-apiv1applicantsnumbercollege-details)
            - [GET /api/v1/events/peek](#get-apiv1eventspeek)
            - [PUT /api/v1/events/{id}/ack](#put-apiv1eventsidack)
            - [PUT /api/v1/offers/pay-offer](#put-apiv1offerspay-offer)
    - [Objects](#objects)
        - [Address](#address)
        - [Applicant](#applicant)
        - [ApplicantCredential](#applicantcredential)
        - [ApplicantName](#applicantname)
        - [ApplicantCollegeDetails](#applicantcollegedetails)
        - [ApplicantProficiency](#applicantproficiency)
        - [ApplicantProficiencySubScore](#applicantproficiencysubscore)
        - [Application](#application)
        - [BinaryDocument](#binarydocument)
        - [EmergencyContact](#emergencycontact)
        - [OfferPaid](#offerpaid)
        - [Phone](#phone)
        - [Program](#program)
        - [ProgramSelection](#programselection)
        - [SisEvent](#sisevent)
        - [SisInboundEvent](#sisinboundevent)
        - [Term](#term)
    - [Lookups](#lookups)
        - [ApplicationCycle](#applicationcycle)
        - [CanadianStatus](#canadianstatus)
        - [Country and Provinces](#country-and-provinces)
        - [EducationCredentialStatus](#educationcredentialstatus)
        - [EducationCredentialType](#educationcredentialtype)
        - [Gender](#gender)
        - [InternationalProgramType](#internationalprogramtype)
        - [Languages](#languages)
        - [NamePrefix](#nameprefix)
        - [NameSuffix](#namesuffix)
        - [PhoneType](#phonetype)
        - [ProgramCredentialType](#programcredentialtype)
        - [SchoolType](#schooltype)
        - [SisInboundEventType](#sisinboundeventtype)
        - [SisOutboundEventType](#sisoutboundeventtype)
        - [TermCode](#termcode)
        - [TestSubType](#testsubtype)
        - [TestType](#testtype)
    - [Sender and Receiver Clients](#sender-and-receiver-clients)
        - [Database Connectivity](#database-connectivity)
        - [Sleep Interval](#sleep-interval)
        - [Logging Configuration](#logging-configuration)
            - [serilog:using:RollingFileAlternate](#serilogusingrollingfilealternate)
            - [serilog:using:EventLog](#serilogusingeventlog)
            - [serilog:using:Console](#serilogusingconsole)
        - [Identity Configuration](#identity-configuration)
            - [Receiver Client](#receiver-client)
                - [Receiver Client Configuration](#receiver-client-configuration)
            - [Sender Client](#sender-client)
                - [Sender Client Configuration](#sender-client-configuration)
        - [Service Installation](#service-installation)
            - [Service Installation - Receiver Client](#service-installation---receiver-client)
            - [Service Installation - Sender Client](#service-installation---sender-client)
        - [Windows Event Log Monitoring](#windows-event-log-monitoring)
        - [Database Structure](#database-structure)
            - [SisInboundEvents Schema](#sisinboundevents-schema)
            - [SisOutboundEvents Schema](#sisoutboundevents-schema)
        - [Error and Warning Codes](#error-and-warning-codes)
            - [Error Codes](#error-codes)
            - [Warning Codes](#warning-codes)
    - [Authentication and Authorization](#authentication-and-authorization)
        - [How to Get a Bearer Token](#how-to-get-a-bearer-token)
    - [Appendix](#appendix)
        - [Appendix: Application](#appendix-application)
            - [Application Submitted JSON](#application-submitted-json)
            - [Application Submitted XML](#application-submitted-xml)
        - [Appendix: ApplicantCollegeDetails](#appendix-applicantcollegedetails)
            - [ApplicantCollegeDetails JSON](#applicantcollegedetails-json)
            - [ApplicantCollegeDetails XML](#applicantcollegedetails-xml)
        - [Appendix: OfferPaid](#appendix-offerpaid)
            - [OfferPaid JSON](#offerpaid-json)
            - [OfferPaid XML](#offerpaid-xml)

Document Revisions
------------------

| Version | Date         | Editor           |
| ------- | ------------ | ---------------- |
| 1.0.3   | Dec 12, 2017 | Michael Aldworth |
| 1.0.2   | Dec 6, 2017  | Jay Dobson       |
| 1.0.1   | Nov 28, 2017 | Jay Dobson       |
| 1.0.0   | Nov 24, 2017 | Michael Aldworth |


### Change History ###

#### 1.0.3 ####

- Updated expected XML output formats within Appendix
- Added Application Screened event type

#### 1.0.2 ####

- Added new response information for endpoints that previously only returned 200 OK
- Added error and warning codes that SISAPI can return

#### 1.0.1 ####

- Added information for Pay Offer endpoint

#### 1.0.0 ####

- Created Documentation

Overview
--------

This document will help you integrate your SIS system with the OCAS International
System.

International SISAPI
---------------------

All interaction with the OCAS International System (OIS) will be done through the
SISAPI. The SISAPI is secured with the OpenId Protocol. In order to receive data
from the HTTP Endpoint, each call will need to be passed a Bearer Token in the
Authorization Header. Please see the [Authentication and Authorization](#authentication-and-authorization)
section to learn how to retrieve a Bearer Token. If you are using the OCAS Supplied
[Sender Client](#sender-client) or [Receiver Client](#receiver-client), we have taken care of the work of acquiring a Bearer Token for you.

### SIS Environments ###

OCAS will provide an environment for testing/integration.

Partner(s) can start to integrate with the EXT environment.

| Environment | Endpoint Info                                         |
| ----------- | ----------------------------------------------------- |
| EXT         | https://\<provided-in-separate-documentation>/swagger |
| PROD        | https://\<provided-in-separate-documentation>/swagger |

### Endpoints ###

Accessing the Swagger URL mentioned in the previous section will present you with
a user friendly grouping of REST API Functionality:

1. Applicants
1. Diagnostics
1. Events

The table below lists the actions that can be made from each controller and their access
limitation.

_Note that the SISAPI has a maximum request limit of 10MB._

|                 | Method | Event Direction | Access    | Relative Path                                                                            |
| --------------- | ------ | --------------- | --------- | ---------------------------------------------------------------------------------------- |
| **Applicants**  | PUT    | Partner -> OCAS | Protected | [/api/v1/applicants/{number}/college-details](#put-apiv1applicantsnumbercollege-details) |
| **Events**      | GET    | OCAS -> Partner | Protected | [/api/v1/events/peek](#get-apiv1eventspeek)                                              |
|                 | PUT    | N/A             | Protected | [/api/v1/events/{id}/ack](#put-apiv1eventsidack)                                         |
| **Offers**      | PUT    | Partner -> Ocas | Protected | [/api/v1/offers/pay-offer](#put-apiv1offerspay-offer)                                    |
| **Diagnostics** | GET    | N/A             | Public    | /api/v1/diagnostics/servertime                                                           |
|                 | GET    | N/A             | Public    | /api/v1/diagnostics/logging                                                              |
|                 | GET    | N/A             | Public    | /api/v1/diagnostics/database                                                             |
|                 | GET    | N/A             | Protected | /api/v1/diagnostics/authorization                                                        |

Accessing one of the public endpoints will get its respective response back. If
you access one of the Protected endpoints, you will get an 'Authorization denied'
response.

```json
{
  "message": "Authorization has been denied for this request."
}
```

Please see the [Authentication and Authorization](#authentication-and-authorization)
section.

You will notice that all events are transmitted to the Partner through the **Peek*
endpoint. This is delibrate, as the payload will contain the event action type and
payload. You can see [available events below](#sisinboundeventtype), which must be individually toggled on individually
through configuration by OCAS in order to start receiving them.

#### PUT /api/v1/applicants/{number}/college-details ####

| Url Query Parameters | Value            |
| -------------------- | ---------------- |
| number               | applicant number |

| Request Body | Value                                                           |
| ------------ | --------------------------------------------------------------- |
| model.id     | long (Unique for every event. Auto-incrementing ID recommended) |
| model.data   | [applicant college details](#applicantcollegedetails)           |

**_Example:_**

```json
{
  "id": 18,
  "data": {
    "number": "X1185392",
    "studentId": "CID-12345-SA"
  }
}
```

**_Example Request:_**
   ```HTTP
   PUT /api/v1/applicants/{number}/college-details HTTP/1.1
   Host: <ocas-sis-api-environment>
   Content-Type: application/json
   Authorization: Bearer <token received from identity server>
   Cache-Control: no-cache
   ```

**_Example Response:_**

```HTTP
200 (Success)
{
  "operationId": "00000000-0000-0000-0000-000000000000",
  "errors": [
    {
      "code": "string",
      "message": "string"
    }
  ],
  "warnings": [
    {
      "code": "string",
      "message": "string"
    }
  ]
}
```

#### GET /api/v1/events/peek ####

Receive a list of all un-acked events (ordered by EventId).

| Url Query Parameters | Value                                        |
| -------------------- | -------------------------------------------- |
| count                | number greater than 0. Max is 500 at a time. |

**_Example Request:_**
   ```HTTP
   GET /api/v1/events/peek?count={number} HTTP/1.1
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
      "data": { }
    }
  },
  // SisInboundEvent
  {
    "id": 4,
    "eventInfo":
    {
      "action": "AnotherEventTitle",
      "data": { }
    }
  },
  // SisInboundEvent
  {
    "id": 5,
    "eventInfo":
    {
      "action": "CouldBeSameEventTitle",
      "data": { }
    }
  }
]
```

In the above example, you can see we have 3 [SisInboundEvents](#sisinboundevent).

#### PUT /api/v1/events/{id}/ack ####

The ack endpoint is intended to acknowledge the successful retrieval of
the specified event.

| Url Query Parameters | Value                                   |
| -------------------- | --------------------------------------- |
| id                   | the id of the event you are confirming. |

**_Example Request:_**

   ```HTTP
   PUT /api/v1/events/{id}/ack HTTP/1.1
   Host: <ocas-sis-api-environment>
   Content-Type: application/json
   Authorization: Bearer <token received from identity server>
   Cache-Control: no-cache
   ```

**_Example Response:_**

```HTTP
200 (Success)
{
  "operationId": "00000000-0000-0000-0000-000000000000",
  "errors": [
    {
      "code": "string",
      "message": "string"
    }
  ],
  "warnings": [
    {
      "code": "string",
      "message": "string"
    }
  ]
}
```

#### PUT /api/v1/offers/pay-offer ####

| Request Body | Value                                                           |
| ------------ | --------------------------------------------------------------- |
| model        | [SisInboundEvent](#SisInboundEvent)                             |
| model.id     | long (Unique for every event. Auto-incrementing ID recommended) |
| model.data   | [OfferPaid](#OfferPaid)                                         |

**_Example:_**

```json
{
  "id": 25,
  "data": {
    "applicationNumber": "X1484937",
    "applicationCycle": "2017",
    "campusCode": "main",
    "deliveryOption": "fulltime",
    "programCode": "TSTA01",
    "term": "fall",
    "receipt": {
      "data": "[base 64 encoded string]",
      "filename": "filename.jpg",
      "mimeType": "image/jpeg",
      "length": 96041
    }
  }
}
```

**_Example Request:_**

   ```HTTP
   PUT /api/v1/offers/pay-offer HTTP/1.1
   Host: <ocas-sis-api-environment>
   Content-Type: application/json
   Authorization: Bearer <token received from identity server>
   Cache-Control: no-cache
   ```

**_Example Response:_**

```HTTP
200 (Success)
{
  "operationId": "00000000-0000-0000-0000-000000000000",
  "errors": [
    {
      "code": "string",
      "message": "string"
    }
  ],
  "warnings": [
    {
      "code": "string",
      "message": "string"
    }
  ]
}
```

Objects
-------

### Address ###

| Property   | Type                                                                 |
| ---------- | -------------------------------------------------------------------- |
| street     | _string_ (min 1, max 80)                                             |
| apartment  | _[nullable] string_ (min 1, max 40)                                  |
| city       | _string_ (min 1, max 30)                                             |
| province   | _[nullable] string_ ISO3166-2 [see mappings](#country-and-provinces) |
| country    | _string_ ISO3166-1 alpha-2 [see mappings](#country-and-provinces)    |
| postalCode | _string_ (min 1, max 17)                                             |

**_Example:_**

```JSON
{
  "street": "131 Gottlieb Squares",
  "apartment": "2148",
  "city": "Johnton",
  "province": null,
  "country": "YE",
  "postalCode": "35625-6412"
}
```

### Applicant ###

| Property                  | Type                                                              |
| ------------------------- | ----------------------------------------------------------------- |
| id                        | _string_ guid                                                     |
| number                    | _string_ (min 1, max 20)                                          |
| version                   | number (used for historical profile tracking)                     |
| created                   | _string_ ISO 8601 Date Formatted String                           |
| legalName                 | [ApplicantName](#applicantname)                                   |
| dateOfBirth               | _string_ date string in format `yyyy-MM-dd`                       |
| canadianStatus            | [CanadianStatus](#canadianstatus)                                 |
| primaryCitizenshipCountry | _string_ ISO3166-1 alpha-2 [see mappings](#country-and-provinces) |
| fullLegalName             | _string_ (min 1, max 450)                                         |
| casualNames               | Array[0..10] of [ApplicantName](#applicantname)                   |
| gender                    | _string_ [Gender](#gender)                                        |
| mailingAddress            | [Address](#address)                                               |
| currentAddress            | _[nullable]_ [Address](#address)                                  |
| phones                    | Array[1..10] of [Phone](#phone)                                   |
| emails                    | Array[1..10] of strings (each email, min 5, max 128)              |
| emergencyContact          | [EmergencyContact](#emergencycontact)                             |
| credentials               | Array[1..10] of [Credential](#credential)                         |
| proficiencies             | Array[0..10] of [ApplicantProficiency](#applicantproficiency)     |

Example: See [Appendix: Application](#appendix-application)

### ApplicantCredential ###

| Property       | Type                                                              |
| -------------- | ----------------------------------------------------------------- |
| schoolType     | _string_      [Lookup](#schooltype)                               |
| schoolName     | _string_ (min 1, max 100)                                         |
| country        | _string_ ISO3166-1 alpha-2 [see mappings](#country-and-provinces) |
| programName    | _[nullable] string_ (min 1, max 80)                               |
| status         | _string_ [Lookup](#educationcredentialstatus)                     |
| completionDate | _[nullable] string_ date string in format `yyyy-MM-dd`            |
| credentialType | _[nullable] string_ [Lookup](#educationcredentialtype)            |

**_Example:_**

```JSON
{
  "schoolType": "college",
  "schoolName": "Some School Name",
  "country": "AI",
  "programName": "Something",
  "status": "Completed",
  "completionDate": "2016-04-30",
  "credentialType": null
}
```

### ApplicantName ###

| Property    | Type                                                 |
| ----------- | ---------------------------------------------------- |
| firstName   | _string_ (min 1, max 35)                             |
| middleNames | Array[0..10] of _strings_ (each item, min 1, max 20) |
| lastName    | _string_ (min 1, max 35)                             |
| prefix      | _[nullable] string_ [Lookup](#nameprefix)            |
| suffix      | _[nullable] string_ [Lookup](#namesuffix)            |

**_Example:_**

```JSON
{
  "firstName": "John",
  "middleNames": [],
  "lastName": "O'Keefe",
  "prefix": "mr",
  "suffix": null
}
```

### ApplicantCollegeDetails ###

| Property  | Type                                |
| --------- | ----------------------------------- |
| number    | _string_ _required_ (min 1, max 20) |
| studentId | _string_ (min 0, max 30)            |

**_Example:_**

```JSON
{
  "number": "string",
  "studentId": "string"
}
```

### ApplicantProficiency ###

| Property       | Type                                                                           |
| -------------- | ------------------------------------------------------------------------------ |
| type           | _string_      [Lookup](#testtype)                                              |
| otherName      | _[nullable] string_ (min 1, max 80)                                            |
| score          | _[nullable] string_ (min 1, max 80)                                            |
| completionDate | _[nullable] string_ date string in format `yyyy-MM-dd`                         |
| subScores      | Array[0 or 4] of [ApplicantProficiencySubScore](#applicantproficiencysubscore) |

**_Example:_**

```JSON
{
  "type": "melab",
  "otherName": null,
  "score": "50",
  "completionDate": "2017-01-28",
  "subScores": []
}
```

### ApplicantProficiencySubScore ###

| Property | Type                                 |
| -------- | ------------------------------------ |
| type     | _string_      [Lookup](#testsubtype) |
| score    | _string_ (min 1, max 80)             |

**_Example:_**

```JSON
{
  "type": "listening",
  "score": "100",
}
```

### Application ###

| Property   | Type                                           |
| ---------- | ---------------------------------------------- |
| id         | _string_ guid                                  |
| number     | _string_ (min 1, max 20)                       |
| created    | _string_ ISO 8601 Date Formatted String        |
| applicant  | [Applicant](#applicant)                        |
| selections | Array of [ProgramSelection](#programselection) |

Example: See [Appendix: Application](#appendix-application)

### BinaryDocument ###

| Property | Type                            |
| -------- | ------------------------------- |
| data     | _string_ Base 64 encoded string |
| filename | _string_ (min 1, max 255)       |
| mimetype | _string_ (min 1, max 255)       |
| length   | _long_ File size in bytes       |

**_Example:_**

```JSON
{
  "data": "[base 64 encoded string]",
  "filename": "filename.jpg",
  "mimeType": "image/jpeg",
  "length": 96041
}
```

### EmergencyContact ###

| Property      | Type                                     |
| ------------- | ---------------------------------------- |
| name          | _string_ (min 1, max 100)                |
| phone         | [Phone](#phone)                          |
| email         | _string_ (min 5, max 128)                |
| relationship  | _string_ (min 1, max 50)                 |
| firstLanguage | _string_ [Lookup](#languages) ISO 6392-1 |

**_Example:_**

```JSON
{
  "name" : "Beth Smith",
  "phone" : {},
  "email" : "beth@example.com",
  "relationship" : "Mother",
  "firstLanguage" : "en"
}
```

### OfferPaid ###

| Property          | Type                              |
| ----------------- | --------------------------------- |
| applicationNumber | _string_ (min 1, max 20)          |
| applicationCycle  | _string_ (min 1, max 50)          |
| campusCode        | _string_ (min 1, max 4)           |
| deliveryOption    | _string_ (min 1, max 50)          |
| programCode       | _string_ (min 1, max 10)          |
| term              | _string_ (min 1, max 50)          |
| receipt           | [BinaryDocument](#binarydocument) |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "applicationCycle" : "2018" ,
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "tst100",
  "term" : "fall",
  "receipt" : {}
}
```

### Phone ###

| Property | Type                                                                        |
| -------- | --------------------------------------------------------------------------- |
| type     | _string_ [Lookup](#phonetype)                                               |
| number   | _string_ (min 1, max 20) follows format "\<iso3166-1 alpha-2\>-01234567890" |
| ext      | _[nullable] string_ (min 1, max 5)                                          |

**_Example:_**

```JSON
{
  "type": "mobile",
  "number": "US+1234567890",
  "ext": null
}
```

### Program ###

| Property                 | Type                                           |
| ------------------------ | ---------------------------------------------- |
| code                     | _string_ (min 1, max 10)                       |
| title                    | _string_                                       |
| credential               | _string_ ([Lookup](#programcredentialtype))    |
| internationalProgramType | _string_ ([Lookup](#internationalprogramtype)) |

**_Example:_**

```JSON
{
  "code": "X1423",
  "title": "Some Test Program",
  "credential": "diploma",
  "internationalProgramType": "Normal"
}
```

### ProgramSelection ###

| Property         | Type                                                                      |
| ---------------- | ------------------------------------------------------------------------- |
| term             | [Term](#termcode)                                                         |
| program          | [Program](#program)                                                       |
| campusPreference | _string_ (min 1, max 4) (college assigned Campus Code)                    |
| choiceNumber     | _number_ (less than 0 = EAP/ESL Program, greater than 0 = Normal Program) |

Example: See [Appendix: Application](#appendix-application)

### SisEvent ###

| Property | Type                                                 |
| -------- | ---------------------------------------------------- |
| action   | _string_ [SisInboundEventType](#sisinboundeventtype) |
| data     | Varies based on the Action                           |

**_Example:_**

```JSON
{
  "action": "SomeEvent",
  "data": { }         // Varies based on SisInboundEventType
}
```

### SisInboundEvent ###

| Property  | Type                  | Comment                                                            |
| --------- | --------------------- | ------------------------------------------------------------------ |
| id        | _number_              | unique number, should always be processed from smallest to largest |
| eventInfo | [SisEvent](#sisevent) |                                                                    |

```JSON
{
  "id": 0,
  "eventInfo": { }
}
```

### Term ###

| Property         | Type                                                         |
| ---------------- | ------------------------------------------------------------ |
| applicationCycle | _number_ ([ApplicationCycleLookup](#applicationcyclelookup)) |
| code             | _string_ ([Lookup](#termlookup))                             |
| startDate        | _string_ date string in format `yyyy-MM-dd`                  |
| endDate          | _string_ date string in format `yyyy-MM-dd`                  |

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

### ApplicationCycle ###

4-digit Year (e.g. 2016, 2024)

[Db Export](lookups/ApplicationCycles.csv)

### CanadianStatus ###

| Code              |
| ----------------- |
| none              |
| aboriginal        |
| conventionrefugee |
| offshoreschool    |
| pr                |
| refugee           |
| study             |
| visa              |
| other             |

### Country and Provinces ###

[Db Export](lookups/CountryProvinceCodeMappings.csv)

### EducationCredentialStatus ###

| Code         |
| ------------ |
| Completed    |
| InProgress   |
| NotCompleted |

### EducationCredentialType ###

| Code              |
| ----------------- |
| secondary-diploma |
| secondary-other   |
| university-degree |
| university-other  |
| college-diploma   |
| college-other     |

### Gender ###

| Code   |
| ------ |
| male   |
| female |
| other  |

### InternationalProgramType ###

| Code   |
| ------ |
| Normal |
| Esl    |
| Eap    |

### Languages ###

[Db Export](lookups/LanguageMappings.csv)

### NamePrefix ###

| Code |
| ---- |
| mr   |
| mrs  |
| ms   |
| miss |
| dr   |

### NameSuffix ###

| Code |
| ---- |
| jr   |
| sr   |
| i    |
| ii   |
| iii  |
| iv   |
| v    |
| vi   |
| vii  |
| viii |
| ix   |
| x    |

### PhoneType ###

| Code   |
| ------ |
| home   |
| mobile |
| other  |

### ProgramCredentialType ###

| Code                |
| ------------------- |
| advanceddiploma     |
| certificate         |
| degree              |
| diploma             |
| graduatecertificate |
| other               |

### SchoolType ###

| Code       |
| ---------- |
| secondary  |
| college    |
| university |

### SisInboundEventType ###

| Key                  | Data Object Type            |
| -------------------- | --------------------------- |
| ApplicationSubmitted | [Application](#application) |
| ApplicationScreened  | [Application](#application) |

### SisOutboundEventType ###

| Key                           | Data Object Type                                    |
| ----------------------------- | --------------------------------------------------- |
| UpdateApplicantCollegeDetails | [ApplicantCollegeDetails](#applicantcollegedetails) |
| PayOffer                      | [OfferPaid](#offerpaid)                             |

### TermCode ###

Each application cycle will have the following 3 codes corresponding to
to each year. A code + year combo gives us a unique way to
represent the time an intake is being offered.

| Code   |
| ------ |
| fall   |
| winter |
| spring |

### TestSubType ###

| Code      |
| --------- |
| listening |
| reading   |
| writing   |
| speaking  |

### TestType ###

| Code      |
| --------- |
| cael      |
| cambridge |
| cefr      |
| eap       |
| eps       |
| ielts     |
| melab     |
| plte      |
| toefl     |
| other     |

Sender and Receiver Clients
---------------------------

OCAS has built two Windows services (C# .NET Framework 4.6) to help facilitate
the two-way transportation between our SISAPI and the College's SIS systems. You don't
need to use them, if you are comfortable following the above documentation above.

The following section outlines the various configuration options found in both the
Receiver and Sender Clients.

### Database Connectivity ###

The sender and receiver clients support Microsoft SQL Server and Oracle 11G and above.

| Property    | Default                    |
| ----------- | -------------------------- |
| ocasIntlSis | Database Connection String |

Example SQL Server Connection String
`Data Source=(SERVER_HERE)\INSTANCE_HERE;Initial Catalog=ocas_sis_intl;UserId=USERID_HERE;Password=PASSWORD_HERE`

Example Oracle Connection String
`Data Source=(DESCRIPTION=(ADDRESS=(PROTOCOL=TCP)(HOST=HOST_HERE)(PORT=1521))(CONNECT_DATA=(SERVICE_NAME=SERVICE_NAME_HERE)));Password=PASSWORD_HERE;User ID=USERID_HERE;`

### Sleep Interval ###

The following configuration will dictate how often the Sender and Receiver client
will poll for new events to process.

| Property                      | Default       |
| ----------------------------- | ------------- |
| client:scheduleSleep:duration | 300ms (5 min) |

### Logging Configuration ###

The Sender and Receiver clients leverage Serilog for event and error logging.

| Property              | Default     |
| --------------------- | ----------- |
| serilog:minimum-level | Information |

#### serilog:using:RollingFileAlternate ####

The rolling file feature creates application event logs within a series of rolling files.

| Property                                                     | Default                          |
| ------------------------------------------------------------ | -------------------------------- |
| serilog:write-to:RollingFileAlternate.logDirectory           | C:\\Logs\\ocas-sis-intl-receiver |
| serilog:write-to:RollingFileAlternate.fileSizeLimitBytes     | 10485760 (10MB)                  |
| serilog:write-to:RollingFileAlternate.retainedFileCountLimit | 50                               |

serilog:write-to:RollingFileAlternate.outputTemplate
`{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level}] [{SourceContext}] [{CorrelationId}] {Message}{NewLine}{Exception}`

#### serilog:using:EventLog ####

The event log feature creates application event logs within the Windows Event Viewer.

| Property                                           | Default                |
| -------------------------------------------------- | ---------------------- |
| serilog:write-to:EventLog.source                   | ocas-sis-intl-receiver |
| serilog:write-to:EventLog.logName                  | Application            |
| serilog:write-to:EventLog.manageEventSource        | false                  |
| serilog:write-to:EventLog.restrictedToMinimumLevel | 3 (Error)              |

serilog:write-to:EventLog.outputTemplate
`{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level}] [{SourceContext}] [{CorrelationId}] {Message}{NewLine}{Exception}`

#### serilog:using:Console ####

The console feature outputs process information to the console window.

| Property                 | Default |
| ------------------------ | ------- |
| serilog:write-to:console | (blank) |

### Identity Configuration ###

[See Authentication](#authentication-and-authorization) for more details on how 
to obtain a username, password and secret.

| Property                | Default                                                 |
| ----------------------- | ------------------------------------------------------- |
| ocas:idsvr:publicOrigin | \<ToBeProvided\>                                        |
| ocas:idsvr:sts          | \<ToBeProvided\>                                        |
| ocas:idsvr:clientId     | \<ToBeProvided\>                                        |
| ocas:idsvr:scope        | \<ToBeProvided\>                                        |
| ocas:idsvr:secret       | [See Authentication](#authentication-and-authorization) |
| ocas:idsvr:username     | [See Authentication](#authentication-and-authorization) |
| ocas:idsvr:password     | [See Authentication](#authentication-and-authorization) |

#### Receiver Client ####

The receiver client will retrieve pending SIS Events from the OCAS SIS API
in the sequence they were generated. These events will be inserted into the
SisInboundEvents table in the JSON (default) or XML format (if specified).

##### Receiver Client Configuration #####

You can configure the output format by setting the following configuration property.

| Property           | Default                  |
| ------------------ | ------------------------ |
| client:eventFormat | json/xml (Default: json) |

#### Sender Client ####

The sender client will read pending SIS Events sequentially from the source database.
Data will always be transmitted as JSON to the OCAS SIS API. Data in XML format will be
converted prior to transmission.

##### Sender Client Configuration #####

No custom sender configurations.

### Service Installation ###

The following commands will install the Receiver and Sender clients as Windows Services.

#### Service Installation - Receiver Client ####

`Ocas.Sis.International.ReceiverClient.Service.exe install -displayname:Ocas.Sis.Intl.ReceiverClient -servicename:Ocas.Sis.Intl.ReceiverClient --delayed`

#### Service Installation - Sender Client ####

`Ocas.Sis.International.SenderClient.Service.exe install -displayname:Ocas.Sis.Intl.SenderClient -servicename:Ocas.Sis.Intl.SenderClient --delayed`

### Windows Event Log Monitoring ###

The following commands will allow the SIS Receiver and Sender applications to
create logging entries within the Windows Event Viewer without administrative rights.

```POWERSHELL
> [System.Diagnostics.EventLog]::CreateEventSource("ocas-sis-intl-receiver", "Application")
> [System.Diagnostics.EventLog]::CreateEventSource("ocas-sis-intl-sender", "Application")
```

### Database Structure ###

The SIS Receiver and Sender applications each have an individual database table 
required to write and read events respecfully.

| Name              | Type    | Purpose                  |
| ----------------- | ------- | ------------------------ |
| SisOutboundEvents | _table_ | Sis Outbound Event Queue |
| SisInboundEvents  | _table_ | Sis Inbound Event Queue  |

#### SisInboundEvents Schema ####

| Column Name | Column Type    | Purpose                       |
| ----------- | -------------- | ----------------------------- |
| id          | _bigint_       | Event Unique Primary Key      |
| eventInfo   | _varchar(max)_ | Event Payload Data            |
| eventFormat | _varchar(5)_   | Event Format Type (json, xml) |
| createdDate | _datetime2_    | Created Date                  |

#### SisOutboundEvents Schema ####

| Column Name      | Column Type    | Purpose                             |
| ---------------- | -------------- | ----------------------------------- |
| id               | _bigint_       | Event Unique Primary Key            |
| status           | _varchar(50)_  | Event Status (Default: Pending)     |
| type             | _varchar(50)_  | [Event Type](#sisoutboundeventtype) |
| eventInfo        | _varchar(max)_ | Event Payload Data                  |
| eventFormat      | _varchar(5)_   | Event Format Type (json, xml)       |
| createdDate      | _datetime2_    | Created Date                        |
| lastModifiedDate | _datetime2_    | Last Modified Date                  |

### Error and Warning Codes ###

#### Error Codes ####

Below is a table of error codes that may be returned from the SisApi

| Code  | Description                               |
| ----- | ----------------------------------------- |
| E0001 | Unknown Middleware Exception              |
| E0030 | Not Found Error                           |
| E0056 | Invalid Feature Configuration             |
| E0070 | Error In State Machine                    |
| E0071 | Invalid state transition                  |
| E0080 | Invalid Term Code                         |
| E0081 | Invalid Program Code                      |
| E0082 | Invalid Campus Code                       |
| E0083 | Invalid Delivery Option Code              |
| E0084 | Invalid Application Cycle                 |
| E0086 | Duplicate Event Id Race Condition         |
| E0085 | Duplicate Event Id With Different Payload |
| E0090 | Ack Out of Order                          |
| E0091 | Invalid Offer State Transition            |

#### Warning Codes ####

Below is a table of warning codes that may be returned from the SisApi

| Code  | Description                                        |
| ----- | -------------------------------------------------- |
| W0010 | Duplicate Event Id and Payload Sent to API         |
| W0110 | Attempt to Pay Offer In Revoked or Withdrawn State |

Authentication and Authorization
--------------------------------

If you are using the Sender and Receiver Clients, you can skip this whole section.
We've done the work for you!

You can get a Bearer Token through making an HTTP POST to our OCAS Identity Server
(OIDS). We will provide you the OIDS in a separate e-mail.

### How to Get a Bearer Token ###

If you've made it this far, you are acquiring the token on your own. Great! You will
need to craft an HTTP POST as shown below in Step 1.

1. OCAS will provide you with `<base64secret>, <username>, and <password>`, which
should be replaced in the urlencoded params.

   Example Request:
   ```HTTP
   POST /core/connect/token HTTP/1.1
   Host: <OIDS>.ca
   Content-Type: application/x-www-form-urlencoded
   Authorization: Basic <base64secret>
   Cache-Control: no-cache

   username=<username>&password=<password>&grant_type=password&scope=intlsis_api
   ```
   Example Response:
   ```HTTP
   {
     "access_token": "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9.TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ",
     "expires_in": 3600,
     "token_type": "Bearer"
   }
   ```

1. In the above response, 'access_token' is the actual token needed to make further
API calls. When the token is generated, that access_token is valid for
1 hour (3600 seconds), which should be more than enough for any scheduled task or
cronjob, consuming data. You will want to copy/store the value for **access_token**
in a variable, then construct another HTTP Request with the word `Bearer <token_value>`
in the Authorization Header as follows:
   ```HTTP
   GET /api/v1/diagnostics/authorization HTTP/1.1
   Host: <OIS>.ca
   Authorization: Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiYWRtaW4iOnRydWV9.TJVA95OrM7E2cBab30RMHrHDcEfxjoYZgeFONFh7HgQ
   Accept: application/json
   Cache-Control: no-cache
   ```
   Example Response:
   ```json
   {
     "name": "Partner User",
     "customerCode": "TEST",
     "roles": "Sis"
   }
   ```

You now have a token that you can use for any number of subsequent protected SIS
endpoint calls. Remember that the token will last only for 1 hour and you will need
a new token to make any protected API call requests after an hour.

Appendix
--------

The appendix includes models and examples too large for the above document.

### Appendix: Application ###

Used by:
- SisInboundEventType.ApplicationSubmitted
- SisInboundEventType.ApplicationScreened

The Application object includes a variety of Applicant and Application data.
Note: Empty JSON collections are not represented within the XML.

#### Application Submitted JSON ####

```JSON
{
  "action": "ApplicationSubmitted",
  "data": {
    "id": "94c70fcc-41ce-e711-8733-e4b318b38df4",
    "number": "X1484933",
    "applicant": {
      "id": "7af3adf7-8c1f-4ede-8169-1dbd178e29ba",
      "number": "X1185393",
      "version": 2,
      "created": "0001-01-01T00:00:00",
      "legalName": {
        "firstName": "Kaia",
        "middleNames": [],
        "lastName": "O'Keefe",
        "prefix": null,
        "suffix": null
      },
      "dateOfBirth": "1993-10-26",
      "canadianStatus": "other",
      "primaryCitizenshipCountry": "AF",
      "fullLegalName": "Kaia O'Keefe",
      "casualNames": [],
      "gender": "other",
      "mailingAddress": {
        "street": "131 Gottlieb Squares",
        "apartment": "2148",
        "city": "Johnton",
        "province": null,
        "country": "YE",
        "postalCode": "35625-6412"
      },
      "currentAddress": {
        "street": "3724 Colt Port",
        "apartment": "542",
        "city": "Port Melyssafurt",
        "province": null,
        "country": "PK",
        "postalCode": "43194"
      },
      "phones": [
        {
          "type": "home",
          "number": "US+19083680301",
          "ext": null
        },
        {
          "type": "other",
          "number": "US+15259228253",
          "ext": null
        },
        {
          "type": "other",
          "number": "US+8899746991",
          "ext": null
        }
      ],
      "emails": [
        "Kaia.OKeefe@mailinator.com"
      ],
      "emergencyContact": {
        "name": "Rozella Bayer",
        "phone": {
          "type": "home",
          "number": "US+8286856966",
          "ext": null
        },
        "email": "Rozella51@mailinator.com",
        "relationship": "cumque",
        "firstLanguage": null
      },
      "credentials": [
        {
          "schoolType": "college",
          "schoolName": "minus-sunt-ea",
          "country": "AI",
          "programName": "illo",
          "status": "Completed",
          "completionDate": "2016-04-30",
          "credentialType": null
        },
        {
          "schoolType": "college",
          "schoolName": "praesentium-quae-est",
          "country": "GS",
          "programName": "quis",
          "status": "Completed",
          "completionDate": "2017-02-19",
          "credentialType": "college-diploma"
        }
      ],
      "proficiencies": [
        {
          "type": "melab",
          "otherName": null,
          "score": "50",
          "completionDate": "2017-01-28",
          "subScores": [
            {
              "type": "writing",
              "score": "82"
            },
            {
              "type": "reading",
              "score": "36"
            },
            {
              "type": "speaking",
              "score": "18"
            },
            {
              "type": "listening",
              "score": "92"
            }
          ]
        },
        {
          "type": "cael",
          "otherName": null,
          "score": "75",
          "completionDate": "2016-07-18",
          "subScores": [
            {
              "type": "writing",
              "score": "56"
            },
            {
              "type": "reading",
              "score": "40"
            },
            {
              "type": "speaking",
              "score": "28"
            },
            {
              "type": "listening",
              "score": "69"
            }
          ]
        },
        {
          "type": "eap",
          "otherName": null,
          "score": "89",
          "completionDate": "2017-04-19",
          "subScores": []
        }
      ]
    },
    "selections": [
      {
        "term": {
          "applicationCycle": 2017,
          "code": "fall",
          "startDate": "2016-08-01",
          "endDate": "2016-11-30"
        },
        "program": {
          "code": "TST1ESL2",
          "title": "ESL Program 2",
          "credential": "other",
          "internationalProgramType": "Esl"
        },
        "campusPreference": null,
        "choiceNumber": -1
      },
      {
        "term": {
          "applicationCycle": 2018,
          "code": "spring",
          "startDate": "2018-04-01",
          "endDate": "2018-07-31"
        },
        "program": {
          "code": "TST1C3",
          "title": "Certificate 3",
          "credential": "certificate",
          "internationalProgramType": "Normal"
        },
        "campusPreference": null,
        "choiceNumber": 1
      }
    ],
    "created": "2017-11-20T22:26:05.9616078Z"
  }
}
```

#### Application Submitted XML ####

```XML
<root>
  <action>ApplicationSubmitted</action>
  <data>
    <id>94c70fcc-41ce-e711-8733-e4b318b38df4</id>
    <number>X1484933</number>
    <applicant>
      <id>7af3adf7-8c1f-4ede-8169-1dbd178e29ba</id>
      <number>X1185393</number>
      <version>2</version>
      <created>0001-01-01T00:00:00</created>
      <legalName>
        <firstName>Kaia</firstName>
        <lastName>O'Keefe</lastName>
        <prefix />
        <suffix />
      </legalName>
      <dateOfBirth>1993-10-26</dateOfBirth>
      <canadianStatus>other</canadianStatus>
      <primaryCitizenshipCountry>AF</primaryCitizenshipCountry>
      <fullLegalName>Kaia O'Keefe</fullLegalName>
      <gender>other</gender>
      <mailingAddress>
        <street>131 Gottlieb Squares</street>
        <apartment>2148</apartment>
        <city>Johnton</city>
        <province />
        <country>YE</country>
        <postalCode>35625-6412</postalCode>
      </mailingAddress>
      <currentAddress>
        <street>3724 Colt Port</street>
        <apartment>542</apartment>
        <city>Port Melyssafurt</city>
        <province />
        <country>PK</country>
        <postalCode>43194</postalCode>
      </currentAddress>
      <phones>
        <type>home</type>
        <number>US+19083680301</number>
        <ext />
      </phones>
      <phones>
        <type>other</type>
        <number>US+15259228253</number>
        <ext />
      </phones>
      <phones>
        <type>other</type>
        <number>US+8899746991</number>
        <ext />
      </phones>
      <emails>Kaia.OKeefe@mailinator.com</emails>
      <emergencyContact>
        <name>Rozella Bayer</name>
        <phone>
          <type>home</type>
          <number>US+8286856966</number>
          <ext />
        </phone>
        <email>Rozella51@mailinator.com</email>
        <relationship>cumque</relationship>
        <firstLanguage />
      </emergencyContact>
      <credentials>
        <schoolType>college</schoolType>
        <schoolName>minus-sunt-ea</schoolName>
        <country>AI</country>
        <programName>illo</programName>
        <status>Completed</status>
        <completionDate>2016-04-30</completionDate>
        <credentialType />
      </credentials>
      <credentials>
        <schoolType>college</schoolType>
        <schoolName>praesentium-quae-est</schoolName>
        <country>GS</country>
        <programName>quis</programName>
        <status>Completed</status>
        <completionDate>2017-02-19</completionDate>
        <credentialType>college-diploma</credentialType>
      </credentials>
      <proficiencies>
        <type>melab</type>
        <otherName />
        <score>50</score>
        <completionDate>2017-01-28</completionDate>
        <subScores>
          <type>writing</type>
          <score>82</score>
        </subScores>
        <subScores>
          <type>reading</type>
          <score>36</score>
        </subScores>
        <subScores>
          <type>speaking</type>
          <score>18</score>
        </subScores>
        <subScores>
          <type>listening</type>
          <score>92</score>
        </subScores>
      </proficiencies>
      <proficiencies>
        <type>cael</type>
        <otherName />
        <score>75</score>
        <completionDate>2016-07-18</completionDate>
        <subScores>
          <type>writing</type>
          <score>56</score>
        </subScores>
        <subScores>
          <type>reading</type>
          <score>40</score>
        </subScores>
        <subScores>
          <type>speaking</type>
          <score>28</score>
        </subScores>
        <subScores>
          <type>listening</type>
          <score>69</score>
        </subScores>
      </proficiencies>
      <proficiencies>
        <type>eap</type>
        <otherName />
        <score>89</score>
        <completionDate>2017-04-19</completionDate>
      </proficiencies>
    </applicant>
    <selections>
      <term>
        <applicationCycle>2017</applicationCycle>
        <code>fall</code>
        <startDate>2016-08-01</startDate>
        <endDate>2016-11-30</endDate>
      </term>
      <program>
        <code>TST1ESL2</code>
        <title>ESL Program 2</title>
        <credential>other</credential>
        <internationalProgramType>Esl</internationalProgramType>
      </program>
      <campusPreference />
      <choiceNumber>-1</choiceNumber>
    </selections>
    <selections>
      <term>
        <applicationCycle>2018</applicationCycle>
        <code>spring</code>
        <startDate>2018-04-01</startDate>
        <endDate>2018-07-31</endDate>
      </term>
      <program>
        <code>TST1C3</code>
        <title>Certificate 3</title>
        <credential>certificate</credential>
        <internationalProgramType>Normal</internationalProgramType>
      </program>
      <campusPreference />
      <choiceNumber>1</choiceNumber>
    </selections>
    <created>2017-11-20T22:26:05.9616078Z</created>
  </data>
</root>
```

### Appendix: ApplicantCollegeDetails ###

#### ApplicantCollegeDetails JSON ####

```JSON
{
  "number": "X12345",
  "studentId": "SID-1234"
}
```

#### ApplicantCollegeDetails XML ####

```XML
<root>
  <number>ApplicationScreened</number>
  <studentId>ApplicationScreened</studentId>
</root>
```

### Appendix: OfferPaid ###

#### OfferPaid JSON ####

```JSON
{
  "applicationNumber": "X1484937",
  "applicationCycle": "2017",
  "campusCode": "main",
  "deliveryOption": "fulltime",
  "programCode": "TSTA01",
  "term": "fall",
  "receipt": {
    "data": "[base 64 encoded string]",
    "filename": "filename.jpg",
    "mimeType": "image/jpeg",
    "length": 96041
  }
}
```

#### OfferPaid XML ####

```XML
<root>
  <applicationNumber>X1484937</applicationNumber>
  <applicationCycle>2017</applicationCycle>
  <campusCode>main</campusCode>
  <deliveryOption>fulltime</deliveryOption>
  <programCode>TSTA01</programCode>
  <term>fall</term>
  <receipt>
    <data>[base 64 encoded string]</data>
    <filename>filename.jpg</filename>
    <mimeType>image/jpeg</mimeType>
    <length>96041</length>
  </receipt>
</root>
```