OCAS International SIS Integration Guide
========================================

Table of Contents
-----------------

- [OCAS International SIS Integration Guide](#ocas-international-sis-integration-guide)
  - [Table of Contents](#table-of-contents)
  - [Document Revisions](#document-revisions)
    - [Change History](#change-history)
      - [1.5.3](#153)
      - [1.5.2](#152)
      - [1.5.1](#151)
      - [1.5.0](#150)
      - [1.4.0](#140)
      - [1.3.1](#131)
      - [1.3.0](#130)
      - [1.2.1](#121)
      - [1.2.0](#120)
      - [1.1.1](#111)
      - [1.1.0](#110)
      - [1.0.4](#104)
      - [1.0.3](#103)
      - [1.0.2](#102)
      - [1.0.1](#101)
      - [1.0.0](#100)
  - [Overview](#overview)
  - [International SISAPI](#international-sisapi)
    - [SIS Environments](#sis-environments)
    - [Endpoints](#endpoints)
      - [PUT /api/v1/applicants/{number}/college-details](#put-apiv1applicantsnumbercollege-details)
      - [POST /api/v1/events](#post-apiv1events)
      - [GET /api/v1/events/peek](#get-apiv1eventspeek)
      - [PUT /api/v1/events/{id}/ack](#put-apiv1eventsidack)
      - [PUT /api/v1/offers/pay-offer](#put-apiv1offerspay-offer)
  - [Objects](#objects)
    - [Address](#address)
    - [Agency](#agency)
    - [Applicant](#applicant)
    - [ApplicantCredential](#applicantcredential)
    - [ApplicantName](#applicantname)
    - [ApplicantCollegeDetails](#applicantcollegedetails)
    - [ApplicantProficiency](#applicantproficiency)
    - [ApplicantProficiencySubScore](#applicantproficiencysubscore)
    - [ApplicantSupportingDocument](#applicantsupportingdocument)
    - [Application](#application)
    - [ApplicationFull](#applicationfull)
    - [BinaryDocument](#binarydocument)
    - [DeclineProgramSelection](#declineprogramselection)
    - [EmergencyContact](#emergencycontact)
    - [NewBinaryDocumentInfo](#newbinarydocumentinfo)
    - [NewOfferInfo](#newofferinfo)
    - [OfferCondition](#offercondition)
    - [OfferDeclined](#offerdeclined)
    - [OfferPreRegistered](#offerpreregistered)
    - [OfferWithdrawn](#offerwithdrawn)
    - [PayOffer](#payoffer)
    - [Phone](#phone)
    - [Program](#program)
    - [ProgramSelection](#programselection)
    - [RevokeOffer](#revokeoffer)
    - [SisEvent](#sisevent)
    - [SisInboundEvent](#sisinboundevent)
    - [Term](#term)
    - [UpdateOffer](#updateoffer)
  - [Lookups](#lookups)
    - [ApplicationCycle](#applicationcycle)
    - [CanadianStatus](#canadianstatus)
    - [Country and Provinces](#country-and-provinces)
    - [EducationCredentialStatus](#educationcredentialstatus)
    - [EducationCredentialType](#educationcredentialtype)
    - [EntryLevelType](#entryleveltype)
    - [Gender](#gender)
    - [IntakeDeliveryOption](#intakedeliveryoption)
    - [InternationalProgramType](#internationalprogramtype)
    - [InternshipType](#internshiptype)
    - [Languages](#languages)
    - [NamePrefix](#nameprefix)
    - [NameSuffix](#namesuffix)
    - [OfferConditionType](#offerconditiontype)
    - [OfferRevokeType](#offerrevoketype)
    - [PhoneType](#phonetype)
    - [ProgramCredentialType](#programcredentialtype)
    - [ProgramDeclineReason](#programdeclinereason)
    - [SchoolType](#schooltype)
    - [SisInboundEventType](#sisinboundeventtype)
    - [SisOutboundEventType](#sisoutboundeventtype)
    - [SupportingDocumentType](#supportingdocumenttype)
    - [TermCode](#termcode)
    - [TestSubType](#testsubtype)
    - [TestType](#testtype)
    - [WithdrawType](#withdrawtype)
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
    - [Appendix: ApplicationFull](#appendix-applicationfull)
      - [ApplicationFull Submitted JSON](#applicationfull-submitted-json)
      - [ApplicationFull Submitted XML](#applicationfull-submitted-xml)
    - [Appendix: Application](#appendix-application)
      - [Application Submitted JSON](#application-submitted-json)
      - [Application XML](#application-xml)
    - [Appendix: ApplicantCollegeDetails](#appendix-applicantcollegedetails)
      - [ApplicantCollegeDetails JSON](#applicantcollegedetails-json)
      - [ApplicantCollegeDetails XML](#applicantcollegedetails-xml)
    - [Appendix: CreateOffer](#appendix-createoffer)
      - [CreateOffer JSON](#createoffer-json)
      - [CreateOffer XML](#createoffer-xml)
    - [Appendix: PayOffer](#appendix-payoffer)
      - [PayOffer JSON](#payoffer-json)
      - [PayOffer XML](#payoffer-xml)
      - [RevokeOffer JSON](#revokeoffer-json)
      - [RevokeOffer XML](#revokeoffer-xml)

Document Revisions
------------------

| Version | Date         | Editor           |
| ------- | ------------ | ---------------- |
| 1.5.3   | Feb 08, 2018 | Kevin Schneider  |
| 1.5.2   | Feb 02, 2018 | Kevin Schneider  |
| 1.5.1   | Jan 30, 2018 | Jay Dobson       |
| 1.5.0   | Jan 26, 2018 | Michael Aldworth |
| 1.4.0   | Jan 18, 2018 | Michael Aldworth |
| 1.3.1   | Jan 10, 2018 | Michael Aldworth |
| 1.3.0   | Jan 05, 2018 | Michael Aldworth |
| 1.2.1   | Dec 19, 2017 | Jay Dobson       |
| 1.2.0   | Dec 18, 2017 | Michael Aldworth |
| 1.1.1   | Dec 13, 2017 | Jay Dobson       |
| 1.1.0   | Dec 12, 2017 | Kevin Schneider  |
| 1.0.4   | Dec 08, 2017 | Michael Aldworth |
| 1.0.3   | Dec 07, 2017 | Michael Aldworth |
| 1.0.2   | Dec 06, 2017 | Jay Dobson       |
| 1.0.1   | Nov 28, 2017 | Jay Dobson       |
| 1.0.0   | Nov 24, 2017 | Michael Aldworth |

### Change History ###

#### 1.5.3 ####

- Update application cycle in JSON/XML samples to have proper year values

#### 1.5.2 ####

- Add financial aid fields NewOfferInfo and UpdateOffer objects

#### 1.5.1 ####

- Fixed bad Term link in ProgramSelection section
- Added updated field to ApplicationFull object

#### 1.5.0 ####

- Updated Offer Term to StartDate
- Add New Outbound Event *UpdateOffer*
- Updated CampusPreference field on programSelection to be PreferredCampusCode
- Added Nuget Package for Sis Models

#### 1.4.0 ####

- Updated Sender/Receiver Clients to v2.0.0 (existing clients will continue to work
but it is recommended to upgrade to v2.0.0 as soon as possible, making sure to take
note of the possible breaking changes in the following 3 bullets)
  - Improvements with Sender/Receiver Clients XML Serialization/Deserialization
  to nest arrays into \<item\> elements. Examples in Appendix are updated to reflect
  this change.
  - Receiver Client version v1.1.0 and earlier were improperly converting json into
  an xml string with leading and trailing quotes. The data was correct, but we
  eliminated the leading and trailing quotations.
  - Receiver Client version v2.0.0 had update to `SisInboundEvents.Insert.sql` in
  both Oracle and MsSql. So if you have customized table names or values in this
  file, you will need to make sure you merge those changes with our updated file.
  Otherwise you can ignore this.
- Fixed Appendix example for BinaryDocument. Had old "addedOn", changed to "uploaded"
and also added "uploadedBy" property to example.
- Added "Parent Event" column to the [inbound events table](#sisinboundeventtype).

#### 1.3.1 ####

- Added agency property to Application object.

#### 1.3.0 ####

- Added ProgramSelectionsUpdated inbound event type
- Renamed ApplicantUpdated inbound event type to ApplicantProfileUpdated
- Renamed Application object to ApplicationFull. This object includes the
applicant object, and now the Application object only contains details about
the application.
- Added submitted and screened properties to Application and ApplicationFull
objects.
- Added updated property to Applicant object.

#### 1.2.1 ####

- Added RevokeOffer outbound event type

#### 1.2.0 ####

- Added ApplicantUpdated, OfferDeclined, OfferPreRegistered and Offer Withdrawn
inbound event types
- Renamed OfferPaid to PayOffer (keep naming consistent, no effect on object)
- Added DeclineProgramChoice and RevokeOffer outbound event types
- Renamed BinaryDocument to NewBinaryDocumentInfo (again, to keep naming consistent)
- Created BinaryDocument object, to represent binary document with embedded link
- Add ApplicantSupportingDocument, which will have the supporting document type

#### 1.1.1 ####

- Updated error codes table to inclde 404.13 when maximum content length is exceeded

#### 1.1.0 ####

- Added CreateOffer outbound event type
- Added generic events SISAPI endpoint details
- Deprecated SISAPI endpoint: [UpdateCollegeApplicantDetails](#put-apiv1applicantsnumbercollege-details)
- Deprecated SISAPI endpoint: [PayOffer](#put-apiv1offerspay-offer)

#### 1.0.4 ####

- Updated XML and JSON Appendix Sample with some middle names and casual names.

#### 1.0.3 ####

- Updated expected XML output formats within Appendix
- Added ApplicationFull Screened event type

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
[Sender Client](#sender-client) or [Receiver Client](#receiver-client),
we have taken care of the work of acquiring a Bearer Token for you.

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
payload. You can see [available events below](#sisinboundeventtype), which must
be individually toggled on individually through configuration by OCAS in order to
start receiving them.

#### PUT /api/v1/applicants/{number}/college-details ####

**_[DEPRECATED] - This endpoint has been replaced by the
[POST /api/v1/events](#post-apiv1events) endpoint_**

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

#### POST /api/v1/events ####

Send an event to OCAS. The action and accompanying data describe
the type of change to be reflected in OCAS International System.

| Request Body | Value                                                                                  |
| ------------ | -------------------------------------------------------------------------------------- |
| id           | _long_ (Unique for every event. Auto-incrementing ID recommended)                      |
| action       | _string_ ([SisOutboundEventType](#sisoutboundeventtype)) - Key                         |
| data         | _variable_ (Refer to [SisOutboundEventType](#sisoutboundeventtype) - Data Object Type) |

**_Example:_**

```json
{
  "id": 18,
  "action": "[action name goes here]",
  "data": { }
}
```

**_Example Request:_**

```HTTP
POST /api/v1/events HTTP/1.1
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

**_[DEPRECATED] - This endpoint has been replaced by the
[POST /api/v1/events](#post-apiv1events) endpoint_**

| Request Body | Value                                                           |
| ------------ | --------------------------------------------------------------- |
| model        | [SisInboundEvent](#SisInboundEvent)                             |
| model.id     | long (Unique for every event. Auto-incrementing ID recommended) |
| model.data   | [PayOffer](#payoffer)                                           |

**_Example:_**

```json
{
  "id": 25,
  "data": {
    "applicationNumber": "X1484937",
    "campusCode": "main",
    "deliveryOption": "fulltime",
    "programCode": "TSTA01",
    "startDate": "2018-03-22",
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

If you are developing in .NET you are in luck! OCAS has provided a nuget package
with all of the Class Objects mentioned below. This will let you serialize and
deserialize easily (we recommend using Newtonsoft.Json).

**Nuget Package: [Ocas.International.Sis.Core](https://www.nuget.org/packages/Ocas.International.Sis.Core/)**

`Install-Package Ocas.International.Sis.Core`

**_JSON Serialization/Deserialization_**

We recommend using [Newtonsoft.Json](https://www.nuget.org/packages/Newtonsoft.Json)
package for serializing and deserializing to the objects. And when using Newtonsoft,
we recommend setting the default converter settings as follows:

```csharp
// This only needs to be set once in your startup code
JsonConvert.DefaultSettings = () => new JsonSerializerSettings
{
    Formatting = Formatting.None,
    ContractResolver = new CamelCasePropertyNamesContractResolver(),
    DateTimeZoneHandling = DateTimeZoneHandling.Utc
};
```

And now to Deserialize or Serialize, please look at the example in [JsonConvert section](https://www.newtonsoft.com/json/help/html/SerializingJSON.htm)

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

### Agency ###

| Property      | Type                                 |
| ------------- | ------------------------------------ |
| name          | _string_ (min 1, max 255)            |
| sisIdentifier | _[nullable] string_ (min 1, max 100) |

**_Example:_**

```JSON
{
  "name": "Agency Test",
  "sisIdentifier": "ABC123"
}
```

### Applicant ###

| Property                  | Type                                                                        |
| ------------------------- | --------------------------------------------------------------------------- |
| id                        | _string_ guid                                                               |
| number                    | _string_ (min 1, max 20)                                                    |
| version                   | number (used for historical profile tracking)                               |
| created                   | _string_ ISO 8601 Date Formatted String                                     |
| updated                   | _string_ ISO 8601 Date Formatted String                                     |
| legalName                 | [ApplicantName](#applicantname)                                             |
| dateOfBirth               | _string_ date string in format `yyyy-MM-dd`                                 |
| canadianStatus            | [CanadianStatus](#canadianstatus)                                           |
| primaryCitizenshipCountry | _string_ ISO3166-1 alpha-2 [see mappings](#country-and-provinces)           |
| fullLegalName             | _string_ (min 1, max 450)                                                   |
| casualNames               | Array[0..10] of [ApplicantName](#applicantname)                             |
| gender                    | _string_ [Gender](#gender)                                                  |
| mailingAddress            | [Address](#address)                                                         |
| currentAddress            | _[nullable]_ [Address](#address)                                            |
| phones                    | Array[1..10] of [Phone](#phone)                                             |
| emails                    | Array[1..10] of strings (each email, min 5, max 128)                        |
| emergencyContact          | [EmergencyContact](#emergencycontact)                                       |
| credentials               | Array[1..10] of [ApplicantCredential](#applicantcredential)                 |
| proficiencies             | Array[0..10] of [ApplicantProficiency](#applicantproficiency)               |
| identificationDocuments   | Array[1..10] of [ApplicantSupportingDocument](#applicantsupportingdocument) |
| visaDocuments             | Array[0..10] of [ApplicantSupportingDocument](#applicantsupportingdocument) |
| otherDocuments            | Array[0..10] of [ApplicantSupportingDocument](#applicantsupportingdocument) |

Example: See [Appendix: ApplicationFull](#appendix-applicationfull)

### ApplicantCredential ###

| Property            | Type                                                                        |
| ------------------- | --------------------------------------------------------------------------- |
| schoolType          | _string_      ([Lookup](#schooltype))                                       |
| schoolName          | _string_ (min 1, max 100)                                                   |
| country             | _string_ ISO3166-1 alpha-2 [see mappings](#country-and-provinces)           |
| programName         | _[nullable] string_ (min 1, max 80)                                         |
| status              | _string_ ([Lookup](#educationcredentialstatus))                             |
| completionDate      | _[nullable] string_ date string in format `yyyy-MM-dd`                      |
| credentialType      | _[nullable] string_ ([Lookup](#educationcredentialtype))                    |
| supportingDocuments | Array[1..10] of [ApplicantSupportingDocument](#applicantsupportingdocument) |

**_Example:_**

```JSON
{
  "schoolType": "college",
  "schoolName": "Some School Name",
  "country": "AI",
  "programName": "Something",
  "status": "Completed",
  "completionDate": "2016-04-30",
  "credentialType": null,
  "supportingDocuments": [{}]
}
```

### ApplicantName ###

| Property    | Type                                                 |
| ----------- | ---------------------------------------------------- |
| firstName   | _string_ (min 1, max 35)                             |
| middleNames | Array[0..10] of _strings_ (each item, min 1, max 20) |
| lastName    | _string_ (min 1, max 35)                             |
| prefix      | _[nullable] string_ ([Lookup](#nameprefix))          |
| suffix      | _[nullable] string_ ([Lookup](#namesuffix))          |

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

| Property            | Type                                                                           |
| ------------------- | ------------------------------------------------------------------------------ |
| type                | _string_ ([Lookup](#testtype))                                                 |
| otherName           | _[nullable] string_ (min 1, max 80)                                            |
| score               | _[nullable] string_ (min 1, max 80)                                            |
| completionDate      | _[nullable] string_ date string in format `yyyy-MM-dd`                         |
| subScores           | Array[0 or 4] of [ApplicantProficiencySubScore](#applicantproficiencysubscore) |
| supportingDocuments | Array[0..10] of [ApplicantSupportingDocument](#applicantsupportingdocument)    |

**_Example:_**

```JSON
{
  "type": "melab",
  "otherName": null,
  "score": "50",
  "completionDate": "2017-01-28",
  "subScores": [],
  "supportingDocuments": []
}
```

### ApplicantProficiencySubScore ###

| Property | Type                              |
| -------- | --------------------------------- |
| type     | _string_ ([Lookup](#testsubtype)) |
| score    | _string_ (min 1, max 80)          |

**_Example:_**

```JSON
{
  "type": "listening",
  "score": "100",
}
```

### ApplicantSupportingDocument ###

| Property        | Type                                                       |
| --------------- | ---------------------------------------------------------- |
| type            | _string_ (Code from [Lookup](#supportingdocumenttype))     |
| category        | _string_ (Category from [Lookup](#supportingdocumenttype)) |
| binaryDocuments | Array[1..10] of [BinaryDocument](#binarydocument)          |

**_Example:_**

```JSON
{
  "type" : "provisionalcertificate",
  "category" : "credential-university",
  "binaryDocuments": [{}]
}
```

### Application ###

| Property   | Type                                               |
| ---------- | -------------------------------------------------- |
| id         | _string_ guid                                      |
| number     | _string_ (min 1, max 20)                           |
| created    | _string_ ISO 8601 Date Formatted String            |
| updated    | _string_ ISO 8601 Date Formatted String            |
| submitted  | _string_ ISO 8601 Date Formatted String            |
| screened   | _[nullable] string_ ISO 8601 Date Formatted String |
| selections | Array of [ProgramSelection](#programselection)     |

Example: See [Appendix: Application](#appendix-application)

### ApplicationFull ###

| Property   | Type                                               |
| ---------- | -------------------------------------------------- |
| id         | _string_ guid                                      |
| number     | _string_ (min 1, max 20)                           |
| agency     | [Agency](#agency)                                  |
| applicant  | [Applicant](#applicant)                            |
| selections | Array of [ProgramSelection](#programselection)     |
| screened   | _[nullable] string_ ISO 8601 Date Formatted String |
| submitted  | _string_ ISO 8601 Date Formatted String            |
| created    | _string_ ISO 8601 Date Formatted String            |
| updated    | _string_ ISO 8601 Date Formatted String            |

Example: See [Appendix: ApplicationFull](#appendix-applicationfull)

### BinaryDocument ###

| Property   | Type                                    |
| ---------- | --------------------------------------- |
| id         | _string_ guid                           |
| link       | _string_ Base 64 encoded string         |
| name       | _string_ (min 1, max 255)               |
| mimeType   | _string_ (min 1, max 255)               |
| uploaded   | _string_ ISO 8601 Date Formatted String |
| uploadedBy | _string_ identity server name of user   |

**_Example:_**

```JSON
{
  "id": "00000000-0000-0000-0000-000000000000",
  "link": "https://someurltodownloadfile",
  "name": "filename.jpg",
  "mimeType": "image/jpeg",
  "uploaded": "2017-12-08T17:19:02.3269001Z",
  "uploadedBy": "Jane Smith"
}
```

### DeclineProgramSelection ###

| Property           | Type                                       |
| ------------------ | ------------------------------------------ |
| applicationNumber  | _string_ (min 1, max 20)                   |
| applicationCycle   | _number_ ([Lookup](#applicationcycle))     |
| programCode        | _string_ (min 1, max 10)                   |
| term               | _string_ ([Lookup](#termcode))             |
| declineReasonCode  | _string_ ([Lookup](#programdeclinereason)) |
| declineReasonOther | _[nullable] string_ (min 1, max 100)       |

**_Example:_**

```JSON
{
  "applicationNumber" : "X1484934",
  "applicationCycle" : 2017,
  "term" : "spring",
  "programCode" : "TST1DG5",
  "declineReasonCode" : "admissionrequirement"
}
```

### EmergencyContact ###

| Property      | Type                                       |
| ------------- | ------------------------------------------ |
| name          | _string_ (min 1, max 100)                  |
| phone         | [Phone](#phone)                            |
| email         | _string_ (min 5, max 128)                  |
| relationship  | _string_ (min 1, max 50)                   |
| firstLanguage | _string_ ([Lookup](#languages)) ISO 6392-1 |

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

### NewBinaryDocumentInfo ###

| Property | Type                            |
| -------- | ------------------------------- |
| data     | _string_ Base 64 encoded string |
| name     | _string_ (min 1, max 255)       |
| mimeType | _string_ (min 1, max 255)       |
| length   | _long_ File size in bytes       |

**_Example:_**

```JSON
{
  "data": "[base 64 encoded string]",
  "name": "filename.jpg",
  "mimeType": "image/jpeg",
  "length": 96041
}
```

### NewOfferInfo ###

| Property                | Type                                                                                  |
| ----------------------- | ------------------------------------------------------------------------------------- |
| applicationNumber       | _string_ (min 1, max 20)                                                              |
| campusCode              | _string_ (min 1, max 4)                                                               |
| deliveryOption          | _string_ ([Lookup](#intakedeliveryoption))                                            |
| programCode             | _string_ (min 1, max 10)                                                              |
| startDate               | _string_ date string in format `yyyy-MM-dd'                                           |
| studentId               | _[nullable] string_ (min 1, max 30)                                                   |
| isPreAdmit              | _boolean_                                                                             |
| entryLevelType          | _[nullable] string_ ([Lookup](#entryleveltype)) defaults to `01`                      |
| isExchange              | _[nullable] boolean_                                                                  |
| internshipType          | _[nullable] string_ ([Lookup](#internshiptype))                                       |
| internshipLength        | _[nullable] decimal(18,1)_ ([required] if internshipType == `optional` or `required`) |
| internshipDescription   | _[nullable] string_ (min 1, max 100)                                                  |
| instructionHours        | _[nullable] decimal(18,1)_                                                            |
| expirationDate          | _[nullable] string_ date string in format `yyyy-MM-dd`                                |
| intakeExpectedEndDate   | _[nullable] string_ date string in format `yyyy-MM-dd`                                |
| firstPaymentAmount      | _[nullable] decimal(18,2)_                                                            |
| firstPaymentDate        | _[nullable] string_ date string in format `yyyy-MM-dd`                                |
| secondPaymentAmount     | _[nullable] decimal(18,2)_                                                            |
| secondPaymentDate       | _[nullable] string_ date string in format `yyyy-MM-dd`                                |
| tuitionFees             | _[nullable] decimal(18,2)_                                                            |
| ancillaryFees           | _[nullable] decimal(18,2)_                                                            |
| hasFinancialAid         | _boolean_                                                                             |
| financialAidDescription | string_ (min 1, max 100) ([required] if hasFinancialAid == `true`)                    |
| conditions              | Array[0..5] of [OfferCondition](#offercondition)                                      |
| customOfferLetter       | _[nullable]_ [NewBinaryDocumentInfo](#newbinarydocumentinfo)                          |

**_Example:_**

```JSON
{
  "applicationNumber" : "X1484934",
  "campusCode" : "C4",
  "deliveryOption" : "fulltime",
  "programCode" : "TST1DG5",
  "startDate" : "2018-01-01",
  "isPreAdmit" : false,
  "isExchange" : true,
  "internshipType" : "notavailable",
  "instructionHours" : 5,
  "expirationDate" : "2018-01-01",
  "intakeExpectedEndDate" : "2018-12-01",
  "firstPaymentAmount" : 100,
  "firstPaymentDate" : "2018-01-01",
  "secondPaymentAmount": 200,
  "secondPaymentDate" : "2018-05-01",
  "tuitionFees" : 50,
  "ancillaryFees" : 50,
  "conditions": [],
  "customOfferLetter" : {}
}
```

**_Notes:_**

Many of the fields on the [NewOfferInfo](#newofferinfo) model can be left
undefined. The values will then be drawn from the program catalogue
within the OCAS International System.

_Be warned, however, that if a value has not been configured in the OIS catalogue
and is also left undefined as part of this event an error will be raised._

These fields are as follows:

- entryLevelType
- isExchange
- internshipType
- internshipDescription
- instructionHours
- expirationDate
- intakeExpectedEndDate
- firstPaymentAmount
- firstPaymentDate
- secondPaymentAmount
- secondPaymentDate
- tuitionFees
- ancillaryFees

If a value is provided for `customOfferLetter` then that will be used,
otherwise the OIS will generate an offer letter on your behalf.

### OfferCondition ###

| Property           | Type                                                          |
| ------------------ | ------------------------------------------------------------- |
| offerConditionType | _string_ ([Lookup](#offerconditiontype))                      |
| other              | _[nullable] string_ (min 1, max 255) set when type is `other` |

### OfferDeclined ###

| Property          | Type                                                 |
| ----------------- | ---------------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                             |
| campusCode        | _string_ (min 1, max 4)                              |
| deliveryOption    | _string_  _string_ ([Lookup](#intakedeliveryoption)) |
| programCode       | _string_ (min 1, max 10)                             |
| startDate         | _string_ date string in format `yyyy-MM-dd'          |
| timestamp         | _string_ ISO 8601 Date Formatted String              |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2017-01-20",
  "timestamp" : "2017-12-08T17:19:02.3269001Z"
}
```

### OfferPreRegistered ###

| Property          | Type                                                 |
| ----------------- | ---------------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                             |
| campusCode        | _string_ (min 1, max 4)                              |
| deliveryOption    | _string_  _string_ ([Lookup](#intakedeliveryoption)) |
| programCode       | _string_ (min 1, max 10)                             |
| startDate         | _string_ date string in format `yyyy-MM-dd'          |
| timestamp         | _string_ ISO 8601 Date Formatted String              |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2017-01-20",
  "timestamp" : "2017-12-08T17:19:02.3269001Z"
}
```

### OfferWithdrawn ###

| Property          | Type                                                       |
| ----------------- | ---------------------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                                   |
| campusCode        | _string_ (min 1, max 4)                                    |
| deliveryOption    | _string_  _string_ ([Lookup](#intakedeliveryoption))       |
| programCode       | _string_ (min 1, max 10)                                   |
| startDate         | _string_ date string in format `yyyy-MM-dd'                |
| timestamp         | _string_ ISO 8601 Date Formatted String                    |
| withdrawnType     | _string_ ([Lookup](#withdrawtype))                         |
| otherReason       | _[null if withdrawnType != other] string_ (min 1, max 100) |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2018-01-20",
  "withdrawnType" : "visadeclined",
  "otherReason" : null
}
```

### PayOffer ###

| Property          | Type                                                         |
| ----------------- | ------------------------------------------------------------ |
| applicationNumber | _string_ (min 1, max 20)                                     |
| campusCode        | _string_ (min 1, max 4)                                      |
| deliveryOption    | _string_  _string_ ([Lookup](#intakedeliveryoption))         |
| programCode       | _string_ (min 1, max 10)                                     |
| startDate         | _string_ date string in format `yyyy-MM-dd'                  |
| receipt           | _[nullable]_ [NewBinaryDocumentInfo](#newbinarydocumentinfo) |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2018-01-20",
  "receipt" : {}
}
```

### Phone ###

| Property | Type                                                                        |
| -------- | --------------------------------------------------------------------------- |
| type     | _string_ ([Lookup](#phonetype))                                             |
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

| Property            | Type                                                                      |
| ------------------- | ------------------------------------------------------------------------- |
| term                | [Term](#term)                                                             |
| program             | [Program](#program)                                                       |
| preferredCampusCode | _[nullable] string_ (min 1, max 4) (college assigned Campus Code)         |
| choiceNumber        | _number_ (less than 0 = EAP/ESL Program, greater than 0 = Normal Program) |

Example: See [Appendix: ApplicationFull](#appendix-applicationfull)

### RevokeOffer ###

| Property          | Type                                                 |
| ----------------- | ---------------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                             |
| campusCode        | _string_ (min 1, max 4)                              |
| deliveryOption    | _string_  _string_ ([Lookup](#intakedeliveryoption)) |
| programCode       | _string_ (min 1, max 10)                             |
| startDate         | _string_ date string in format `yyyy-MM-dd'          |
| revokeType        | _string_ ([Lookup](#offerrevoketype))                |
| otherReason       | _[nullable] string_ (min 1, max 100)                 |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2018-01-20",
  "revokeType" : "other",
  "otherReason" : "something that isn't covered in the list of common responses"
}
```

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

| Property         | Type                                        |
| ---------------- | ------------------------------------------- |
| applicationCycle | _number_ ([Lookup](#applicationcycle))      |
| code             | _string_ ([Lookup](#termcode))              |
| startDate        | _string_ date string in format `yyyy-MM-dd` |
| endDate          | _string_ date string in format `yyyy-MM-dd` |

**_Example:_**

```JSON
{
  "applicationCycle":2019,
  "code":"fall",
  "startDate":"2019-08-01",
  "endDate":"2019-11-30"
}
```

### UpdateOffer ###

| Property                | Type                                                                                  |
| ----------------------- | ------------------------------------------------------------------------------------- |
| applicationNumber       | _string_ (min 1, max 20)                                                              |
| campusCode              | _string_ (min 1, max 4)                                                               |
| deliveryOption          | _string_ ([Lookup](#intakedeliveryoption))                                            |
| programCode             | _string_ (min 1, max 10)                                                              |
| startDate               | _string_ date string in format `yyyy-MM-dd'                                           |
| studentId               | _[nullable] string_ (min 1, max 30)                                                   |
| isPreAdmit              | _boolean_                                                                             |
| entryLevelType          | _[nullable] string_ ([Lookup](#entryleveltype)) defaults to `01`                      |
| isExchange              | _[nullable] boolean_                                                                  |
| internshipType          | _[nullable] string_ ([Lookup](#internshiptype))                                       |
| internshipLength        | _[nullable] decimal(18,1)_ ([required] if internshipType == `optional` or `required`) |
| internshipDescription   | _[nullable] string_ (min 1, max 100)                                                  |
| instructionHours        | _[nullable] decimal(18,1)_                                                            |
| expirationDate          | _[nullable] string_ date string in format `yyyy-MM-dd`                                |
| intakeExpectedEndDate   | _[nullable] string_ date string in format `yyyy-MM-dd`                                |
| firstPaymentAmount      | _[nullable] decimal(18,2)_                                                            |
| firstPaymentDate        | _[nullable] string_ date string in format `yyyy-MM-dd`                                |
| secondPaymentAmount     | _[nullable] decimal(18,2)_                                                            |
| secondPaymentDate       | _[nullable] string_ date string in format `yyyy-MM-dd`                                |
| tuitionFees             | _[nullable] decimal(18,2)_                                                            |
| ancillaryFees           | _[nullable] decimal(18,2)_                                                            |
| hasFinancialAid         | _boolean_                                                                             |
| financialAidDescription | string_ (min 1, max 100) ([required] if hasFinancialAid == `true`)                    |
| conditions              | Array[0..5] of [OfferCondition](#offercondition)                                      |
| customOfferLetter       | _[nullable]_ [NewBinaryDocumentInfo](#newbinarydocumentinfo)                          |

**_Example:_**

```JSON
{
  "applicationNumber" : "X1484934",
  "campusCode" : "C4",
  "deliveryOption" : "fulltime",
  "programCode" : "TST1DG5",
  "startDate" : "2018-01-01",
  "isPreAdmit" : false,
  "isExchange" : true,
  "internshipType" : "notavailable",
  "instructionHours" : 5,
  "expirationDate" : "2018-01-01",
  "intakeExpectedEndDate" : "2018-12-01",
  "firstPaymentAmount" : 100,
  "firstPaymentDate" : "2018-01-01",
  "secondPaymentAmount": 200,
  "secondPaymentDate" : "2018-05-01",
  "tuitionFees" : 50,
  "ancillaryFees" : 50,
  "conditions": [],
  "customOfferLetter" : {}
}
```

**_Notes:_**

Many of the fields on the [UpdateOffer](#updateoffer) model can be left
undefined. The values will then be drawn from the already existing offer
within the OCAS International System.

_Note: Offer Conditions will always be reset each update. So if a previous
offer had condition A, B and C, and then you want to update only the offer
expiration date, you will need to provide condition A, B and C again. If
you don't provide conditions, it will mean they have been lifted (removed)
from the offer._

If a value is provided for `customOfferLetter` then that will be used,
otherwise the OIS will generate an offer letter on your behalf.

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

### EntryLevelType ###

| Code |
| ---- |
| 01   |
| 02   |
| 03   |
| 04   |
| 05   |
| 06   |
| 07   |
| 08   |
| 09   |
| 10   |
| 11   |
| 12   |
| 20   |
| 21   |

### Gender ###

| Code   |
| ------ |
| male   |
| female |
| other  |

### IntakeDeliveryOption ###

| Code     |
| -------- |
| fulltime |
| parttime |

### InternationalProgramType ###

| Code   |
| ------ |
| Normal |
| Esl    |
| Eap    |

### InternshipType ###

| Code         |
| ------------ |
| required     |
| optional     |
| notavailable |

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

### OfferConditionType ###

| Code                   |
| ---------------------- |
| engproficiency         |
| eapcomplete            |
| eslcomplete            |
| escpathway             |
| highschoolcomplete     |
| collegeprogramcomplete |
| universitycomplete     |
| resume                 |
| portfolio              |
| other                  |

### OfferRevokeType ###

| Code             |
| ---------------- |
| deadline         |
| nopaymentnoseats |
| noshow           |
| noseats          |
| novisa           |
| other            |

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

### ProgramDeclineReason ###

| Code                 |
| -------------------- |
| admissionrequirement |
| programcancelled     |
| programsuspended     |
| other                |

### SchoolType ###

| Code       |
| ---------- |
| secondary  |
| college    |
| university |

### SisInboundEventType ###

| Key                      | Data Object Type                          | Parent Event(s)                             |
| ------------------------ | ----------------------------------------- | ------------------------------------------- |
| ApplicantProfileUpdated  | [Applicant](#applicant)                   | ApplicationScreened or ApplicationSubmitted |
| ApplicationScreened      | [ApplicationFull](#applicationfull)       |                                             |
| ApplicationSubmitted     | [ApplicationFull](#applicationfull)       |                                             |
| OfferDeclined            | [OfferDeclined](#offerdeclined)           |                                             |
| OfferWithdrawn           | [OfferWithdrawn](#offerwithdrawn)         |                                             |
| OfferPreRegistered       | [OfferPreRegistered](#OfferPreRegistered) |                                             |
| ProgramSelectionsUpdated | [Application](#application)               | ApplicationScreened or ApplicationSubmitted |

_*Special Note for Parent Event(s):*_ These two events are dependent on being subscribed
to the parent event. This means you have to be subscribed to at least one of the
parent events. These events also behave slightly different depending on which parent
event you are subscribed to.

E.g. If you are subsribed to the ApplicationScreened, then you will not receive any
ApplicantProfileUpdates or ProgramSelectionUpdates until the application has had
it's screened flag marked. This eliminates unnecessary notifications for events that
you might receive during the screening process.

### SisOutboundEventType ###

| Key                           | Data Object Type                                    |
| ----------------------------- | --------------------------------------------------- |
| CreateOffer                   | [NewOfferInfo](#newofferinfo)                       |
| UpdateOffer                   | [UpdateOffer](#updateoffer)                         |
| DeclineProgramSelection       | [DeclineProgramSelection](#declineprogramselection) |
| PayOffer                      | [PayOffer](#payoffer)                               |
| RevokeOffer                   | [RevokeOffer](#revokeoffer)                         |
| UpdateApplicantCollegeDetails | [ApplicantCollegeDetails](#applicantcollegedetails) |

### SupportingDocumentType ###

| Category              | Code                   |
| --------------------- | ---------------------- |
| credential-college    | diploma                |
| credential-college    | proofofenrollment      |
| credential-college    | provisionalcertificate |
| credential-college    | transcript             |
| credential-secondary  | diploma                |
| credential-secondary  | incompletetranscript   |
| credential-secondary  | transcript             |
| credential-university | degree                 |
| credential-university | provisionalcertificate |
| credential-university | transcript             |
| identification        | birthcertificate       |
| identification        | citizenshippapers      |
| identification        | conventionrefugee      |
| identification        | passport               |
| identification        | pr                     |
| other                 | portfolio              |
| other                 | resume                 |
| proficiency           | testresults            |
| visa                  | approvalletter         |
| visa                  | coopworkpermit         |
| visa                  | studypermit            |
| visa                  | visitor                |

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

### WithdrawType ###

| Code         |
| ------------ |
| visadeclined |
| transfer     |
| other        |

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
`{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level}] [{SourceContext}] {Message}{NewLine}{Exception}`

#### serilog:using:EventLog ####

The event log feature creates application event logs within the Windows Event Viewer.

| Property                                           | Default                |
| -------------------------------------------------- | ---------------------- |
| serilog:write-to:EventLog.source                   | ocas-sis-intl-receiver |
| serilog:write-to:EventLog.logName                  | ApplicationFull        |
| serilog:write-to:EventLog.manageEventSource        | false                  |
| serilog:write-to:EventLog.restrictedToMinimumLevel | 3 (Error)              |

serilog:write-to:EventLog.outputTemplate
`{Timestamp:yyyy-MM-dd HH:mm:ss.fff zzz} [{Level}] [{SourceContext}] {Message}{NewLine}{Exception}`

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

| Code   | Description                               |
| ------ | ----------------------------------------- |
| 404.13 | Request content size too large            |
| E0001  | Unknown Middleware Exception              |
| E0030  | Not Found Error                           |
| E0056  | Invalid Feature Configuration             |
| E0070  | Error In State Machine                    |
| E0071  | Invalid state transition                  |
| E0080  | Invalid Term Code                         |
| E0081  | Invalid Program Code                      |
| E0082  | Invalid Campus Code                       |
| E0083  | Invalid Delivery Option Code              |
| E0084  | Invalid Application Cycle                 |
| E0086  | Duplicate Event Id Race Condition         |
| E0085  | Duplicate Event Id With Different Payload |
| E0090  | Ack Out of Order                          |
| E0091  | Invalid Offer State Transition            |

#### Warning Codes ####

Below is a table of warning codes that may be returned from the SisApi

| Code  | Description                                                   |
| ----- | ------------------------------------------------------------- |
| W0010 | Duplicate Event Id and Payload Sent to API                    |
| W0110 | Attempt to Pay Offer In Revoked, Declined, or Withdrawn State |

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

### Appendix: ApplicationFull ###

Used by:
- SisInboundEventType.ApplicationSubmitted
- SisInboundEventType.ApplicationScreened

The ApplicationFull object includes a variety of Applicant and Application data.
Note: Empty JSON collections are not represented within the XML.

#### ApplicationFull Submitted JSON ####

```JSON
{
  "action": "ApplicationSubmitted",
  "data": {
    "id": "85aee8dc-3bdc-e711-8737-e4b318b38df4",
    "number": "X1485152",
    "agency": {
      "name": "Agency Test",
      "sisIdentifier": "ABC123"
    },
    "applicant": {
      "id": "7036e524-305c-4fb6-b45c-61a9f828f35c",
      "number": "X1185682",
      "version": 2,
      "created": "2017-12-08T17:19:02.3269001Z",
      "legalName": {
        "firstName": "Esperanza",
        "middleNames": [
          "Jon",
          "Al"
        ],
        "lastName": "Medhurst",
        "prefix": null,
        "suffix": null
      },
      "dateOfBirth": "1908-03-02",
      "canadianStatus": "none",
      "primaryCitizenshipCountry": "ET",
      "fullLegalName": "Esperanza Abe Lexus Jeromy Edmond Kristian Alan Henry Medhurst",
      "casualNames": [
        {
          "firstName": "Lexus",
          "middleNames": [],
          "lastName": "Abe",
          "prefix": null,
          "suffix": null
        }
      ],
      "gender": "female",
      "mailingAddress": {
        "street": "083 Ismael Lock",
        "apartment": "4579",
        "city": "Sybletown",
        "province": null,
        "country": "BS",
        "postalCode": "16178"
      },
      "currentAddress": {
        "street": "35775 Jessica Street",
        "apartment": "59129",
        "city": "South Sandrine",
        "province": null,
        "country": "TW",
        "postalCode": "97474"
      },
      "phones": [
        {
          "type": "home",
          "number": "US+19083680301",
          "ext": null
        },
        {
          "type": "mobile",
          "number": "US+15259228253",
          "ext": null
        }
      ],
      "emails": [
        "Esperanza77@mailinator.com",
        "Esperanza_Test77@mailinator.com"
      ],
      "emergencyContact": {
        "name": "Lina Streich",
        "phone": {
          "type": "other",
          "number": "US+8899746991",
          "ext": null
        },
        "email": "Lina_Strom87@mailinator.com",
        "relationship": "suscipit",
        "firstLanguage": "gv"
      },
      "credentials": [
        {
          "schoolType": "university",
          "schoolName": "quo-eaque-nemo",
          "country": "VI",
          "programName": "velit",
          "status": "NotCompleted",
          "completionDate": "2016-08-07",
          "credentialType": "university-degree",
          "supportingDocuments": [
            {
              "link": "https://somelinktodocument",
              "name": "my-university-proof.pdf",
              "mimeType": "application/pdf",
              "uploaded": "2017-12-08T16:19:02.3269001Z",
              "uploadedBy": "Beth Smith"
            }
          ]
        },
        {
          "schoolType": "college",
          "schoolName": "sit-qui-omnis",
          "country": "UZ",
          "programName": null,
          "status": "InProgress",
          "completionDate": "2016-03-01",
          "credentialType": "college-other",
          "supportingDocuments": [
            {
              "link": "https://somelinktodocument",
              "name": "my-college-proof.pdf",
              "mimeType": "application/pdf",
              "uploaded": "2017-12-08T16:19:02.3269001Z",
              "uploadedBy": "Beth Smith"
            }
          ]
        },
        {
          "schoolType": "secondary",
          "schoolName": "rerum-nihil-necessitatibus",
          "country": "AD",
          "programName": "fuga",
          "status": "InProgress",
          "completionDate": "2014-12-21",
          "credentialType": "secondary-other",
          "supportingDocuments": [
            {
              "link": "https://somelinktodocument",
              "name": "my-secondary-proof.pdf",
              "mimeType": "application/pdf",
              "uploaded": "2017-12-08T16:19:02.3269001Z",
              "uploadedBy": "Beth Smith"
            }
          ]
        }
      ],
      "proficiencies": [
        {
          "type": "eap",
          "otherName": null,
          "score": "64",
          "completionDate": "2017-11-05",
          "subScores": [],
          "supportingDocuments": []
        },
        {
          "type": "ielts",
          "otherName": null,
          "score": "71",
          "completionDate": "2017-10-19",
          "supportingDocuments": [
            {
              "link": "https://somelinktodocument",
              "name": "my-testscore-pg1.pdf",
              "mimeType": "application/pdf",
              "uploaded": "2017-12-08T16:22:02.3269001Z",
              "uploadedBy": "Beth Smith"
            },
            {
              "link": "https://somelinktodocument",
              "name": "my-testscore-pg2.pdf",
              "mimeType": "application/pdf",
              "uploaded": "2017-12-08T16:22:32.3269001Z",
              "uploadedBy": "Beth Smith"
            }
          ]
        },
        {
          "type": "eap",
          "otherName": null,
          "score": "94",
          "completionDate": "2015-02-05",
          "subScores": [],
          "supportingDocuments": []
        }
      ]
    },
    "selections": [
      {
        "term": {
          "applicationCycle": 2018,
          "code": "fall",
          "startDate": "2018-08-01",
          "endDate": "2018-11-30"
        },
        "program": {
          "code": "TST1ESL1",
          "title": "ESL Program 1",
          "credential": "other",
          "internationalProgramType": "Esl"
        },
        "preferredCampusCode": null,
        "choiceNumber": -1
      },
      {
        "term": {
          "applicationCycle": 2016,
          "code": "fall",
          "startDate": "2016-08-01",
          "endDate": "2016-11-30"
        },
        "program": {
          "code": "TST1O2",
          "title": "Other 2",
          "credential": "other",
          "internationalProgramType": "Normal"
        },
        "preferredCampusCode": null,
        "choiceNumber": 1
      },
      {
        "term": {
          "applicationCycle": 2018,
          "code": "fall",
          "startDate": "2018-08-01",
          "endDate": "2018-11-30"
        },
        "program": {
          "code": "TST1DG1",
          "title": "Degree 1",
          "credential": "degree",
          "internationalProgramType": "Normal"
        },
        "preferredCampusCode": null,
        "choiceNumber": 2
      }
    ],
    "screened": null,
    "submitted": "2017-12-09T11:19:46.6378594Z",
    "created": "2017-12-08T17:19:02.3269001Z",
    "updated": "2017-12-10T11:19:46.6378594Z"
  }
}
```

#### ApplicationFull Submitted XML ####

```XML
<root>
  <action>ApplicationSubmitted</action>
  <data>
    <id>85aee8dc-3bdc-e711-8737-e4b318b38df4</id>
    <number>X1485152</number>
    <agency>
      <name>Agency Test</name>
      <sisIdentifier>ABC123</sisIdentifier>
    </agency>
    <applicant>
      <id>7036e524-305c-4fb6-b45c-61a9f828f35c</id>
      <number>X1185682</number>
      <version>2</version>
      <created>2017-12-08T17:19:02.3269001Z</created>
      <legalName>
        <firstName>Esperanza</firstName>
        <middleNames>
          <item>Jon</item>
          <item>Al</item>
        </middleNames>
        <lastName>Medhurst</lastName>
        <prefix />
        <suffix />
      </legalName>
      <dateOfBirth>1908-03-02</dateOfBirth>
      <canadianStatus>none</canadianStatus>
      <primaryCitizenshipCountry>ET</primaryCitizenshipCountry>
      <fullLegalName>Esperanza Abe Lexus Jeromy Edmond Kristian Alan Henry Medhurst</fullLegalName>
      <casualNames>
        <item>
          <firstName>Lexus</firstName>
          <middleNames />
          <lastName>Abe</lastName>
          <prefix />
          <suffix />
        </item>
      </casualNames>
      <gender>female</gender>
      <mailingAddress>
        <street>083 Ismael Lock</street>
        <apartment>4579</apartment>
        <city>Sybletown</city>
        <province />
        <country>BS</country>
        <postalCode>16178</postalCode>
      </mailingAddress>
      <currentAddress>
        <street>35775 Jessica Street</street>
        <apartment>59129</apartment>
        <city>South Sandrine</city>
        <province />
        <country>TW</country>
        <postalCode>97474</postalCode>
      </currentAddress>
      <phones>
        <item>
          <type>home</type>
          <number>US+19083680301</number>
          <ext />
        </item>
        <item>
          <type>mobile</type>
          <number>US+15259228253</number>
          <ext />
        </item>
      </phones>
      <emails>
        <item>Esperanza77@mailinator.com</item>
        <item>Esperanza_Test77@mailinator.com</item>
      </emails>
      <emergencyContact>
        <name>Lina Streich</name>
        <phone>
          <type>other</type>
          <number>US+8899746991</number>
          <ext />
        </phone>
        <email>Lina_Strom87@mailinator.com</email>
        <relationship>suscipit</relationship>
        <firstLanguage>gv</firstLanguage>
      </emergencyContact>
      <credentials>
        <item>
          <schoolType>university</schoolType>
          <schoolName>quo-eaque-nemo</schoolName>
          <country>VI</country>
          <programName>velit</programName>
          <status>NotCompleted</status>
          <completionDate>2016-08-07</completionDate>
          <credentialType>university-degree</credentialType>
          <supportingDocuments>
            <item>
              <link>https://somelinktodocument</link>
              <name>my-university-proof.pdf</name>
              <mimeType>application/pdf</mimeType>
              <uploaded>2017-12-08T16:19:02.3269001Z</uploaded>
              <uploadedBy>Beth Smith</uploaded>
            </item>
          </supportingDocuments>
        </item>
        <item>
          <schoolType>college</schoolType>
          <schoolName>sit-qui-omnis</schoolName>
          <country>UZ</country>
          <programName />
          <status>InProgress</status>
          <completionDate>2016-03-01</completionDate>
          <credentialType>college-other</credentialType>
          <supportingDocuments>
            <item>
              <link>https://somelinktodocument</link>
              <name>my-college-proof.pdf</name>
              <mimeType>application/pdf</mimeType>
              <uploaded>2017-12-08T16:19:02.3269001Z</uploaded>
              <uploadedBy>Beth Smith</uploaded>
            </item>
          </supportingDocuments>
        </item>
        <item>
          <schoolType>secondary</schoolType>
          <schoolName>rerum-nihil-necessitatibus</schoolName>
          <country>AD</country>
          <programName>fuga</programName>
          <status>InProgress</status>
          <completionDate>2014-12-21</completionDate>
          <credentialType>secondary-other</credentialType>
          <supportingDocuments>
            <item>
              <link>https://somelinktodocument</link>
              <name>my-secondary-proof.pdf</name>
              <mimeType>application/pdf</mimeType>
              <uploaded>2017-12-08T16:19:02.3269001Z</uploaded>
              <uploadedBy>Beth Smith</uploaded>
            </item>
          </supportingDocuments>
        </item>
      </credentials>
      <proficiencies>
        <item>
          <type>eap</type>
          <otherName />
          <score>64</score>
          <completionDate>2017-11-05</completionDate>
          <subScores />
          <supportingDocuments />
        </item>
        <item>
          <type>ielts</type>
          <otherName />
          <score>71</score>
          <completionDate>2017-10-19</completionDate>
          <supportingDocuments>
            <item>
              <link>https://somelinktodocument</link>
              <name>my-testscore-pg1.pdf</name>
              <mimeType>application/pdf</mimeType>
              <uploaded>2017-12-08T16:22:02.3269001Z</uploaded>
              <uploadedBy>Beth Smith</uploaded>
            </item>
            <item>
              <link>https://somelinktodocument</link>
              <name>my-testscore-pg2.pdf</name>
              <mimeType>application/pdf</mimeType>
              <uploaded>2017-12-08T16:22:32.3269001Z</uploaded>
              <uploadedBy>Beth Smith</uploaded>
            </item>
          </supportingDocuments>
        </item>
        <item>
          <type>eap</type>
          <otherName />
          <score>94</score>
          <completionDate>2015-02-05</completionDate>
          <subScores />
          <supportingDocuments />
        </item>
      </proficiencies>
    </applicant>
    <selections>
      <item>
        <term>
          <applicationCycle>2018</applicationCycle>
          <code>fall</code>
          <startDate>2018-08-01</startDate>
          <endDate>2018-11-30</endDate>
        </term>
        <program>
          <code>TST1ESL1</code>
          <title>ESL Program 1</title>
          <credential>other</credential>
          <internationalProgramType>Esl</internationalProgramType>
        </program>
        <preferredCampusCode />
        <choiceNumber>-1</choiceNumber>
      </item>
      <item>
        <term>
          <applicationCycle>2016</applicationCycle>
          <code>fall</code>
          <startDate>2016-08-01</startDate>
          <endDate>2016-11-30</endDate>
        </term>
        <program>
          <code>TST1O2</code>
          <title>Other 2</title>
          <credential>other</credential>
          <internationalProgramType>Normal</internationalProgramType>
        </program>
        <preferredCampusCode />
        <choiceNumber>1</choiceNumber>
      </item>
      <item>
        <term>
          <applicationCycle>2018</applicationCycle>
          <code>fall</code>
          <startDate>2018-08-01</startDate>
          <endDate>2018-11-30</endDate>
        </term>
        <program>
          <code>TST1DG1</code>
          <title>Degree 1</title>
          <credential>degree</credential>
          <internationalProgramType>Normal</internationalProgramType>
        </program>
        <preferredCampusCode />
        <choiceNumber>2</choiceNumber>
      </item>
    </selections>
    <screened />
    <submitted>2017-12-09T11:19:46.6378594Z</submitted>
    <created>2017-12-08T17:19:02.3269001Z</created>
    <updated>2017-12-10T11:19:46.6378594Z</updated>
  </data>
</root>
```

### Appendix: Application ###

Used by:
- SisInboundEventType.ProgramSelectionsUpdated

#### Application Submitted JSON ####

```JSON
{
  "action": "ProgramSelectionsUpdated",
  "data": {
    "id": "85aee8dc-3bdc-e711-8737-e4b318b38df4",
    "number": "X1485152",
    "selections": [
      {
        "term": {
          "applicationCycle": 2018,
          "code": "fall",
          "startDate": "2018-08-01",
          "endDate": "2018-11-30"
        },
        "program": {
          "code": "TST1ESL1",
          "title": "ESL Program 1",
          "credential": "other",
          "internationalProgramType": "Esl"
        },
        "preferredCampusCode": null,
        "choiceNumber": -1
      },
      {
        "term": {
          "applicationCycle": 2016,
          "code": "fall",
          "startDate": "2016-08-01",
          "endDate": "2016-11-30"
        },
        "program": {
          "code": "TST1O2",
          "title": "Other 2",
          "credential": "other",
          "internationalProgramType": "Normal"
        },
        "preferredCampusCode": null,
        "choiceNumber": 1
      },
      {
        "term": {
          "applicationCycle": 2018,
          "code": "fall",
          "startDate": "2018-08-01",
          "endDate": "2018-11-30"
        },
        "program": {
          "code": "TST1DG1",
          "title": "Degree 1",
          "credential": "degree",
          "internationalProgramType": "Normal"
        },
        "preferredCampusCode": null,
        "choiceNumber": 2
      }
    ],
    "screened": null,
    "submitted": "2017-12-09T11:19:46.6378594Z",
    "created": "2017-12-08T17:19:02.3269001Z"
  }
}
```

#### Application XML ####

```XML
<root>
  <action>ProgramSelectionsUpdated</action>
  <data>
    <id>85aee8dc-3bdc-e711-8737-e4b318b38df4</id>
    <number>X1485152</number>
    <selections>
      <item>
        <term>
          <applicationCycle>2018</applicationCycle>
          <code>fall</code>
          <startDate>2018-08-01</startDate>
          <endDate>2018-11-30</endDate>
        </term>
        <program>
          <code>TST1ESL1</code>
          <title>ESL Program 1</title>
          <credential>other</credential>
          <internationalProgramType>Esl</internationalProgramType>
        </program>
        <preferredCampusCode />
        <choiceNumber>-1</choiceNumber>
      </item>
      <item>
        <term>
          <applicationCycle>2016</applicationCycle>
          <code>fall</code>
          <startDate>2016-08-01</startDate>
          <endDate>2016-11-30</endDate>
        </term>
        <program>
          <code>TST1O2</code>
          <title>Other 2</title>
          <credential>other</credential>
          <internationalProgramType>Normal</internationalProgramType>
        </program>
        <preferredCampusCode />
        <choiceNumber>1</choiceNumber>
      </item>
      <item>
        <term>
          <applicationCycle>2018</applicationCycle>
          <code>fall</code>
          <startDate>2018-08-01</startDate>
          <endDate>2018-11-30</endDate>
        </term>
        <program>
          <code>TST1DG1</code>
          <title>Degree 1</title>
          <credential>degree</credential>
          <internationalProgramType>Normal</internationalProgramType>
        </program>
        <preferredCampusCode />
        <choiceNumber>2</choiceNumber>
      </item>
    </selections>
    <screened />
    <submitted>2017-12-09T11:19:46.6378594Z</submitted>
    <created>2017-12-08T17:19:02.3269001Z</created>
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
  <number>X12345</number>
  <studentId>SID-1234</studentId>
</root>
```

### Appendix: CreateOffer ###

#### CreateOffer JSON ####

```JSON
{
  "applicationNumber" : "X1484934",
  "campusCode" : "C4",
  "deliveryOption" : "fulltime",
  "programCode" : "TST1DG5",
  "startDate" : "2018-06-25",
  "isPreAdmit" : false,
  "isExchange" : true,
  "internshipType" : "notavailable",
  "instructionHours" : 5,
  "expirationDate" : "2018-01-01",
  "intakeExpectedEndDate" : "2018-12-01",
  "firstPaymentAmount" : 100,
  "firstPaymentDate" : "2018-01-01",
  "secondPaymentAmount": 200,
  "secondPaymentDate" : "2018-05-01",
  "tuitionFees" : 50,
  "ancillaryFees" : 50,
  "hasFinancialAid": true,
  "financialAidDescription": "Acme Scholarship",
  "conditions": [
    {
      "offerConditionType": "eslcomplete"
    },
    {
      "offerConditionType": "other",
      "other": "Must get straight A's"
    }
  ],
  "customOfferLetter" : {
    "data": "[base 64 encoded string]",
    "name": "filename.pdf",
    "mimeType": "application/pdf",
    "length": 96041
  }
}
```

#### CreateOffer XML ####

```XML
<root>
  <applicationNumber>X1484934</applicationNumber>
  <campusCode>C4</campusCode>
  <deliveryOption>fulltime</deliveryOption>
  <programCode>TST1DG5</programCode>
  <startDate>2018-06-25</startDate>
  <isPreAdmit>false</isPreAdmit>
  <isExchange>true</isExchange>
  <internshipType>notavailable</internshipType>
  <instructionHours>5</instructionHours>
  <expirationDate>2018-01-01</expirationDate>
  <intakeExpectedEndDate>2018-12-01</intakeExpectedEndDate>
  <firstPaymentAmount>100</firstPaymentAmount>
  <firstPaymentDate>2018-01-01</firstPaymentDate>
  <secondPaymentAmount>200</secondPaymentAmount>
  <secondPaymentDate>2018-05-01</secondPaymentDate>
  <tuitionFees>50</tuitionFees>
  <ancillaryFees>50</ancillaryFees>
  <hasFinancialAid>true</hasFinancialAid>
  <financialAidDescription>Acme Scholarship</financialAidDescription>
  <conditions>
    <item>
      <offerConditionType>eslcomplete</offerConditionType>
    </item>
    <item>
      <offerConditionType>other</offerConditionType>
      <other>Must get straight A's</other>
    </item>
  </conditions>
  <customOfferLetter>
    <data>[base 64 encoded string]</data>
    <name>filename.pdf</name>
    <mimeType>application/pdf</mimeType>
    <length>96041</length>
  </customOfferLetter>
</root>
```

### Appendix: PayOffer ###

#### PayOffer JSON ####

```JSON
{
  "applicationNumber": "X1484937",
  "campusCode": "main",
  "deliveryOption": "fulltime",
  "programCode": "TSTA01",
  "startDate": "2018-11-14",
  "receipt": {
    "data": "[base 64 encoded string]",
    "name": "filename.jpg",
    "mimeType": "image/jpeg",
    "length": 96041
  }
}
```

#### PayOffer XML ####

```XML
<root>
  <applicationNumber>X1484937</applicationNumber>
  <campusCode>main</campusCode>
  <deliveryOption>fulltime</deliveryOption>
  <programCode>TSTA01</programCode>
  <startDate>2018-11-14</startDate>
  <receipt>
    <data>[base 64 encoded string]</data>
    <name>filename.jpg</name>
    <mimeType>image/jpeg</mimeType>
    <length>96041</length>
  </receipt>
</root>
```

#### RevokeOffer JSON ####

```JSON
{
  "applicationNumber": "X1484937",
  "campusCode": "main",
  "deliveryOption": "fulltime",
  "programCode": "TSTA01",
  "startDate": "2018-08-17",
  "revokeType": "other",
  "otherReason" : "something that isn't covered in the list of common responses"
}
```

#### RevokeOffer XML ####

```XML
<root>
  <applicationNumber>X1484937</applicationNumber>
  <campusCode>main</campusCode>
  <deliveryOption>fulltime</deliveryOption>
  <programCode>TSTA01</programCode>
  <startDate>2018-08-17</startDate>
  <revokeType>other</revokeType>
  <otherReason>something that isn't covered in the list of common responses</otherReason>
</root>
```