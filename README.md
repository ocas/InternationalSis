OCAS International SIS Integration Guide
========================================

Table of Contents
-----------------

- [Change History](#change-history)
  - [1.8.10](#1810)
  - [1.8.9](#189)
  - [1.8.8](#188)
  - [1.8.7](#187)
  - [1.8.6](#186)
  - [1.8.5](#185)
  - [1.8.4](#184)
  - [1.8.3](#183)
  - [1.8.2](#182)
  - [1.8.1](#181)
  - [1.8.0](#180)
  - [1.7.6](#176)
  - [1.7.5](#175)
  - [1.7.4](#174)
  - [1.7.3](#173)
  - [1.7.2](#172)
  - [1.7.1](#171)
  - [1.7.0](#170)
  - [1.6.6](#166)
  - [1.6.5](#165)
  - [1.6.4](#164)
  - [1.6.3](#163)
  - [1.6.2](#162)
  - [1.6.1](#161)
  - [1.6.0](#160)
  - [1.5.4](#154)
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
- [SIS Environments](#sis-environments)
- [Endpoints](#endpoints)
  - [POST /api/v1/events](#post-apiv1events)
  - [GET /api/v1/events/peek](#get-apiv1eventspeek)
  - [GET /api/v1/binary-documents/{id}](#get-apiv1binarydocument)
  - [PUT /api/v1/events/{id}/ack](#put-apiv1eventsidack)
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
- [ExchangePartner](#exchangepartner)
- [Intake](#intake)
- [NewBinaryDocumentInfo](#newbinarydocumentinfo)
- [NewOfferInfo](#newofferinfo)
- [NewPaymentReceiptInfo](#newpaymentreceiptinfo)
- [OfferAccepted](#offeraccepted)
- [OfferDetails](#offerdetails)
- [OfferCondition](#offercondition)
- [OfferDeclined](#offerdeclined)
- [OfferPreRegistered](#offerpreregistered)
- [OfferRevoked](#offerrevoked)
- [OfferWithdrawn](#offerwithdrawn)
- [OfferPaymentReceipt](#offerpaymentreceipt)
- [Phone](#phone)
- [PreAdmitOfferAccepted](#preadmitofferaccepted)
- [Program](#program)
- [ProgramDecision](#programdecision)
- [ProgramSelection](#programselection)
- [ProgramSelectionDecisionUpdated](#programselectiondecisionupdated)
- [ProgramSelectionDeclined](#programselectiondeclined)
- [Referrals](#referrals)
- [RevokeOffer](#revokeoffer)
- [SisEvent](#sisevent)
- [SisInboundEvent](#sisinboundevent)
- [Term](#term)
- [UpdateOffer](#updateoffer)
- [ApplicationCycle](#applicationcycle)
- [CanadianStatus](#canadianstatus)
- [Country and Provinces](#country-and-provinces)
- [EducationCredentialStatus](#educationcredentialstatus)
- [EducationCredentialType](#educationcredentialtype)
- [ApplicationEnglishProficiency](#applicationEnglishProficiency)
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
- [OfferState](#offerstate)
- [PhoneType](#phonetype)
- [ProgramCredentialType](#programcredentialtype)
- [ProgramDecisionState](#programdecisionstate)
- [ProgramDeclineReason](#programdeclinereason)
- [ReceiptType](#receipttype)
- [SchoolType](#schooltype)
- [ScreeningStatus](#screeningStatus)
- [SisInboundEventType](#sisinboundeventtype)
- [SisOutboundEventType](#sisoutboundeventtype)
- [SupportingDocumentType](#supportingdocumenttype)
- [TermCode](#termcode)
- [TestSubType](#testsubtype)
- [TestType](#testtype)
- [WithdrawType](#withdrawtype)
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
- [Maintenance Error Message](#maintenance-error-message)
- [How to Get a Bearer Token](#how-to-get-a-bearer-token)
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
- [Appendix: OfferCreated](#appendix-offercreated)
  - [OfferCreated JSON](#offercreated-json)
  - [OfferCreated XML](#offercreated-xml)
- [Appendix: OfferPaymentReceipt](#appendix-offerpaymentreceipt)
  - [OfferPaymentReceipt JSON](#offerpaymentreceipt-json)
  - [OfferPaymentReceipt XML](#offerpaymentreceipt-xml)
- [Appendix: RevokeOffer](#appendix-revokeoffer)
  - [RevokeOffer JSON](#revokeoffer-json)
  - [RevokeOffer XML](#revokeoffer-xml)

Document Revisions
------------------

| Version | Date         | Editor           |
| ------- | ------------ | ---------------- |
| 1.8.10  | Mar 18, 2019 | Jaime Valencia   |
| 1.8.9   | Feb 13, 2019 | Parth Mishra     |
| 1.8.8   | Feb 04, 2018 | Jay Dobson       |
| 1.8.7   | Jan 29, 2018 | Parth Mishra     |
| 1.8.6   | Jan 24, 2018 | Parth Mishra     |
| 1.8.5   | Dec 10, 2018 | Parth Mishra     |
| 1.8.4   | Dec 07, 2018 | Jay Dobson       |
| 1.8.3   | Nov 16, 2018 | Jaime Valencia   |
| 1.8.2   | Oct 05, 2018 | Jay Dobson       |
| 1.8.1   | Aug 30, 2018 | Jaime Valencia   |
| 1.8.0   | Aug 28, 2018 | Jay Dobson       |
| 1.7.6   | Aug 20, 2018 | Jaime Valencia   |
| 1.7.5   | Jul 17, 2018 | Michael Aldworth |
| 1.7.4   | Jul 16, 2018 | Jay Dobson       |
| 1.7.3   | Jun 27, 2018 | Jay Dobson       |
| 1.7.2   | May 29, 2018 | Michael Aldworth |
| 1.7.1   | May 14, 2018 | Jaime Valencia   |
| 1.7.0   | May 08, 2018 | Jaime Valencia   |
| 1.6.6   | Apr 30, 2018 | Jaime Valencia   |
| 1.6.5   | Apr 05, 2018 | Jaime Valencia   |
| 1.6.4   | Mar 26, 2018 | Darren O'Shea    |
| 1.6.3   | Mar 07, 2018 | Jay Dobson       |
| 1.6.2   | Mar 07, 2018 | Michael Aldworth |
| 1.6.1   | Mar 06, 2018 | Jaime Valencia   |
| 1.6.0   | Mar 02, 2018 | Jay Dobson       |
| 1.5.4   | Feb 15, 2018 | Michael Aldworth |
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

#### 1.8.10 ####

- Change property PassportNumber length from 9 to 20 

#### 1.8.9 ####

- Add ApplicationEnglishProficiency and ApplicationUrl to Application and ApplicationFull objects

#### 1.8.8 ####

- Add visa delayed to offer revoke and withdraw type

#### 1.8.7 ####

- Add new offer revoke type

#### 1.8.6 ####

- Add new internship types

#### 1.8.5 ####

- Add Binary documents endpoint

#### 1.8.4 ####

- Add ScreenedStatus to Application and ApplicationFull objects

#### 1.8.3 ####

- Adding new Maintenance Error Message

#### 1.8.2 ####

- Add CountryOfBirth and PrimaryLanguage to Applicant
- Add PSIS codes to LanguageMappings.csv

#### 1.8.1 ####

- Add new inbound ProgramSelectionDecisionUpdated event
- Mark inbound ProgramSelectionDeclined event deprecated

#### 1.8.0 ####

- Add new inbound ApplicationClosed event
- Add new ProgramDecision to [ProgramSelection](#programselection) Object

#### 1.7.6 ####

- Add observation futureintake cannot have an english program

#### 1.7.5 ####

- Add property passportNumber to [Applicant](#applicant) Object

#### 1.7.4 ####

- Add new inbound ApplicationUpdated event
- Mark inbound ProgramSelectionsUpdated event deprecated

#### 1.7.3 ####

- Added new program selection declined reasons

#### 1.7.2 ####

- Added new event AddOfferPaymentReceipt
- Add new property to PayOffer event "generateReceiptInfo", which will generate a receipt from the receipt template
- Add ReceiptType Lookup

#### 1.7.1 ####

- Added intakeId to NewOfferInfo, OfferDetails, OfferWithdrawn, PayOffer, RevokeOffer and UpdateOffer so now the intake
  can be identified using campusCode, deliveryOption, programCode and startDate or intakeId.
- Added intakeId to OfferAccepted, OfferDeclined, OfferPreRegistered, OfferRevoked and  PreAdmitOfferAccepted.
- Added OfferRevoked to SisInboundEventType table.

#### 1.7.0 ####

- Added OfferRevoked inbound event types

#### 1.6.6 ####

- Added PreferredIntakeId to ProgramSelection

#### 1.6.5 ####

- Added new state PreAdmitAccepted to offer
- Added new event PreAdmitOfferAccepted to offer

#### 1.6.4 ####

- Added FutureIntake property to OfferDetails, NewOfferInfo, and UpdateOffer

#### 1.6.3 ####

- Added UnpaidPlacement InternshipType option

#### 1.6.2 ####

- Added new inbound event types OfferCreated and OfferUpdated

#### 1.6.1 ####

- Added New inbound event type *OfferAccepted*.

#### 1.6.0 ####

- Add New Outbound Event *DeclinedProgramSelection*

#### 1.5.4 ####

- Fix typo with one of the RevokeOfferTypes (nopaymentnoseats -> nopayment)
- Renamed [EmergencyContact](#emergencycontact) property from "firstLanguage" ->
  "spokenLanguage". Nuget Package updated to 2.2.2 to reflect this property name
  change.

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

- Updated error codes table to include 404.13 when maximum content length is exceeded

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

All interaction with the OCAS International Application System (IAS) will be done
through the SISAPI. The SISAPI is secured with the OpenId Protocol. In order to
receive data from the HTTP Endpoint, each call will need to be passed a Bearer Token
in the Authorization Header. Please see the [Authentication and Authorization](#authentication-and-authorization)
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
2. Diagnostics
3. Events
4. BinaryDocuments

The table below lists the actions that can be made from each controller and their access
limitation.

_Note that the SISAPI has a maximum request limit of 10MB._

|                 | Method | Event Direction | Access    | Relative Path                                                                            |
| --------------- | ------ | --------------- | --------- | ---------------------------------------------------------------------------------------- |
| **Events**      | GET    | OCAS -> Partner | Protected | [/api/v1/events/peek](#get-apiv1eventspeek)                                              |
                  | GET    | OCAS -> Partner | Protected | [/api/v1/binary-documents/{id}](#get-apiv1binarydocument)                                |
|                 | PUT    | N/A             | Protected | [/api/v1/events/{id}/ack](#put-apiv1eventsidack)                                         |
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
endpoint. This is deliberate, as the payload will contain the event action type and
payload. You can see [available events below](#sisinboundeventtype), which must
be individually toggled on individually through configuration by OCAS in order to
start receiving them.

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
  {
    "id": 1,
    "eventInfo":
    {
      "action": "SomeEventTitle",
      "data": { }
    }
  },
  {
    "id": 4,
    "eventInfo":
    {
      "action": "AnotherEventTitle",
      "data": { }
    }
  },
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

#### GET /api/v1/binary-documents/{id} ####

The binary documents endpoint is intended for successful retrieval of
the specified binary document.

| Url Query Parameters | Value                                   |
| -------------------- | --------------------------------------- |
| id                   | the id of the specific binary document. |

**_Example Request:_**

   ```HTTP
   GET /api/v1/binary-documents/{id} HTTP/1.1
   Host: <ocas-sis-api-environment>
   Content-Type: application/json
   Authorization: Bearer <token received from identity server>
   Cache-Control: no-cache
   ```

**_Example Response:_**

```HTTP
200 (Success)
Download Test_File.pdf
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
| id            | _string_ guid                        |

**_Example:_**

```JSON
{
  "name": "Agency Test",
  "sisIdentifier": "ABC123",
  "id": "083d06b1-4224-4003-919a-fd9fedff428a"
}
```

### Applicant ###

| Property                  | Type                                                                        |
| ------------------------- | --------------------------------------------------------------------------- |
| id                        | _string_ guid                                                               |
| number                    | _string_ (min 1, max 20) the Applicant Number (not Application Number)      |
| version                   | number (used for historical profile tracking)                               |
| created                   | _string_ ISO 8601 Date Formatted String                                     |
| updated                   | _string_ ISO 8601 Date Formatted String                                     |
| legalName                 | [ApplicantName](#applicantname)                                             |
| dateOfBirth               | _string_ date string in format `yyyy-MM-dd`                                 |
| canadianStatus            | [CanadianStatus](#canadianstatus)                                           |
| primaryCitizenshipCountry | _string_ ISO3166-1 alpha-2 [see mappings](#country-and-provinces)           |
| countryOfBirth            | _string_ ISO3166-1 alpha-2 [see mappings](#country-and-provinces)           |
| primaryLanguage           | _string_ ISO639-1 alpha-2 [see mappings](#languages)                        |
| passportNumber            | _string_ matches regular expression _[0-9A-Z]{1,20}_                        |
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
| timestamp                 | _string_ ISO 8601 Date Formatted String                                     |
| by                        | _string_ (min 1, max 255)                                                   |

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
| firstName   | _string_ (min 0, max 35)                             |
| middleNames | Array[0..10] of _strings_ (each item, min 1, max 20) |
| lastName    | _string_ (min 0, max 35)                             |
| prefix      | _[nullable] string_ ([Lookup](#nameprefix))          |
| suffix      | _[nullable] string_ ([Lookup](#namesuffix))          |

**_Notes:_**

The applicant must have a firstName or a lastName, but does not need to have both.
So it's possible to get `"firstName": "", "lastName": "Smith"`. This might require
that upon ingestion into your systems, you substitute an empty character, or marker
character which indicates the applicant does not have a first or last name.

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

| Property                      | Type                                                    |
| ----------------------------- | ------------------------------------------------------- |
| id                            | _string_ guid                                           |
| number                        | _string_ (min 1, max 20) the Application Number         |
| agency                        | [Agency](#agency)                                       |
| referrals                     | [Referrals](#referrals)                                 |
| created                       | _string_ ISO 8601 Date Formatted String                 |
| updated                       | _string_ ISO 8601 Date Formatted String                 |
| submitted                     | _string_ ISO 8601 Date Formatted String                 |
| screeningStatus               | _string_      ([Lookup](#screeningStatus))              |
| screened                      | _[nullable] string_ ISO 8601 Date Formatted String      |
| selections                    | Array of [ProgramSelection](#programselection)          |
| timestamp                     | _string_ ISO 8601 Date Formatted String                 |
| by                            | _string_ (min 1, max 255)                               |
| applicationEnglishProficiency | _string_     ([Lookup](#applicationEnglishProficiency)) |
| applicationUrl                | _string_                                                |

Example: See [Appendix: Application](#appendix-application)

### ApplicationFull ###

| Property                      | Type                                                    |
| ----------------------------- | ------------------------------------------------------- |
| id                            | _string_ guid                                           |
| number                        | _string_ (min 1, max 20) the Application Number         |
| agency                        | [Agency](#agency)                                       |
| applicant                     | [Applicant](#applicant)                                 |
| selections                    | Array of [ProgramSelection](#programselection)          |
| screeningStatus               | _string_      ([Lookup](#screeningStatus))              |
| screened                      | _[nullable] string_ ISO 8601 Date Formatted String      |
| referrals                     | [Referrals](#referrals)                                 |
| submitted                     | _string_ ISO 8601 Date Formatted String                 |
| created                       | _string_ ISO 8601 Date Formatted String                 |
| updated                       | _string_ ISO 8601 Date Formatted String                 |
| timestamp                     | _string_ ISO 8601 Date Formatted String                 |
| by                            | _string_ (min 1, max 255)                               |
| applicationEnglishProficiency | _string_     ([Lookup](#applicationEnglishProficiency)) |
| applicationUrl                | _string_                                                |

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

| Property       | Type                                       |
| -------------- | ------------------------------------------ |
| name           | _string_ (min 1, max 100)                  |
| phone          | [Phone](#phone)                            |
| email          | _string_ (min 5, max 128)                  |
| relationship   | _string_ (min 1, max 50)                   |
| spokenLanguage | _string_ ([Lookup](#languages)) ISO 6392-1 |

**_Example:_**

```JSON
{
  "name" : "Beth Smith",
  "phone" : {},
  "email" : "beth@example.com",
  "relationship" : "Mother",
  "spokenLanguage" : "en"
}
```

### ExchangePartner ###

| Property      | Type                                  |
| ------------- | ------------------------------------- |
| name          | _string_ (min 1, max 255)             |
| sisIdentifier | _string_ (min 1, max 100)             |

**_Example:_**

```JSON
{
  "name": "Test College 1",
  "sisIdentifier": "TST1"
}
```

### Intake ###

| Property          | Type                                        |
| ------------------| --------------------------------------------|
| campusCode        | _string_ (min 1, max 4)                     |
| deliveryOption    | _string_ ([Lookup](#intakedeliveryoption))  |
| programCode       | _string_ (min 1, max 10)                    |
| startDate         | _string_ date string in format `yyyy-MM-dd` |
| intakeId          | _[nullable] string_ guid                    |

**_Example:_**

```JSON
{
  "campusCode" : "C4",
  "deliveryOption" : "fulltime",
  "programCode" : "TST1DG5",
  "startDate" : "2018-01-01",
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

| Property                | Type                                                                                                       |
| ----------------------- | ---------------------------------------------------------------------------------------------------------- |
| applicationNumber       | _string_ (min 1, max 20)                                                                                   |
| campusCode              | _string_ (min 1, max 4)  _[nullable]_ if intakeId is provided                                              |
| deliveryOption          | _string_ ([Lookup](#intakedeliveryoption)) _[nullable]_ if intakeId is provided                            |
| programCode             | _string_ (min 1, max 10) _[nullable]_ if intakeId is provided                                              |
| startDate               | _string_ date string in format `yyyy-MM-dd` _[nullable]_ if intakeId is provided                           |
| intakeId                | _[nullable] string_ guid if provided, then campusCode-deliveryOption-programCode-startDate must be null    |
| studentId               | _[nullable] string_ (min 1, max 30)                                                                        |
| isPreAdmit              | _boolean_                                                                                                  |
| entryLevelType          | _[nullable] string_ ([Lookup](#entryleveltype))                                                            |
| isExchange              | _[nullable] boolean_                                                                                       |
| internshipType          | _[nullable] string_ ([Lookup](#internshiptype))                                                            |
| internshipLength        | _[nullable] decimal(18,1)_ ([required] if internshipType == `optional` or `required` or `unpaidplacement`) |
| internshipDescription   | _[nullable] string_ (min 1, max 100)                                                                       |
| instructionHours        | _[nullable] decimal(18,1)_                                                                                 |
| expirationDate          | _[nullable] string_ date string in format `yyyy-MM-dd`                                                     |
| intakeExpectedEndDate   | _[nullable] string_ date string in format `yyyy-MM-dd`                                                     |
| firstPaymentAmount      | _[nullable] decimal(18,2)_                                                                                 |
| firstPaymentDate        | _[nullable] string_ date string in format `yyyy-MM-dd`                                                     |
| secondPaymentAmount     | _[nullable] decimal(18,2)_                                                                                 |
| secondPaymentDate       | _[nullable] string_ date string in format `yyyy-MM-dd`                                                     |
| tuitionFees             | _[nullable] decimal(18,2)_                                                                                 |
| ancillaryFees           | _[nullable] decimal(18,2)_                                                                                 |
| hasFinancialAid         | _boolean_                                                                                                  |
| financialAidDescription | string_ (min 1, max 100) ([required] if hasFinancialAid == `true`)                                         |
| conditions              | Array[0..5] of [OfferCondition](#offercondition)                                                           |
| customOfferLetter       | _[nullable]_ [NewBinaryDocumentInfo](#newbinarydocumentinfo)                                               |
| futureIntake            | _[nullable]_ [Intake](#intake) (Can not include an english Program.)                                       |

**_Example:_**

```JSON
{
  "applicationNumber" : "X1484934",
  "campusCode" : "C4",
  "deliveryOption" : "fulltime",
  "programCode" : "TST1DG5",
  "startDate" : "2018-01-01",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
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
  "conditions": [],
  "customOfferLetter" : {},
  "futureIntake": {
    "campusCode" : "C4",
    "deliveryOption" : "fulltime",
    "programCode" : "TST1DG5",
    "startDate" : "2018-01-01",
    "intakeId" : "00000000-0000-0000-0000-000000000000"
  }
}
```

**_Notes:_**

Many of the fields on the [NewOfferInfo](#newofferinfo) model can be left
undefined. The values will then be drawn from the program catalogue
within the OCAS International System.

_Be warned, however, that if a value has not been configured in the IAS catalogue
and is also left undefined as part of this event an error will be raised._

These fields are as follows:

- entryLevelType
- isExchange
- internshipType
- internshipLength
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
otherwise the IAS will generate an offer letter on your behalf.

### NewPaymentReceiptInfo ###

| Property    | Type                                                                          |
| ----------- | ----------------------------------------------------------------------------- |
| receiptType | _string_ ([Lookup](#receipttype))                                             |
| paymentDate | _string_ date string in format `yyyy-MM-dd`                                   |
| amount      | _number_ (min 0.00, max 999,999,999.00)                                       |
| number      | _[nullable] string_ the receipt number, invoice number, or college identifier |

**_Example:_**

```JSON
{
  "receiptType": "Deposit",
  "paymentDate": "2018-04-20",
  "amount": 2000.00,
  "number": "INV54321"
}
```

### OfferAccepted ###

| Property          | Type                                                              |
| ----------------- | ----------------------------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                                          |
| campusCode        | _string_ (min 1, max 4)                                           |
| deliveryOption    | _string_ ([Lookup](#intakedeliveryoption))                        |
| programCode       | _string_ (min 1, max 10)                                          |
| startDate         | _string_ date string in format `yyyy-MM-dd`                       |
| intakeId          | _string_ guid                                                     |
| timestamp         | _string_ ISO 8601 Date Formatted String                           |
| by                | _string_ (min 1, max 255)                                         |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2017-01-20",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
  "timestamp" : "2017-12-08T17:19:02.3269001Z",
  "by" : "John Doe"
}
```

### OfferDetails ###

| Property                | Type                                                                                                       |
| ----------------------- | ---------------------------------------------------------------------------------------------------------- |
| applicationNumber       | _string_ (min 1, max 20)                                                                                   |
| campusCode              | _string_ (min 1, max 4) _[nullable]_ if intakeId is provided                                               |
| deliveryOption          | _string_ ([Lookup](#intakedeliveryoption)) _[nullable]_ if intakeId is provided                            |
| programCode             | _string_ (min 1, max 10) _[nullable]_ if intakeId is provided                                              |
| startDate               | _string_ date string in format `yyyy-MM-dd` _[nullable]_ if intakeId is provided                           |
| intakeId                | _[nullable] string_ guid if provided, then campusCode-deliveryOption-programCode-startDate must be null    |
| state                   | _string_ (min 1, max 50) ([Lookup](#offerstate))                                                           |
| studentId               | _[nullable] string_ (min 1, max 30)                                                                        |
| entryLevelType          | _string_ ([Lookup](#entryleveltype))                                                                       |
| isExchange              | _boolean_                                                                                                  |
| internshipType          | _string_ ([Lookup](#internshiptype))                                                                       |
| internshipLength        | _[nullable] decimal(18,1)_ ([required] if internshipType == `optional` or `required` or `unpaidplacement`) |
| internshipDescription   | _[nullable] string_ (min 1, max 100)                                                                       |
| instructionHours        | _[nullable] decimal(18,1)_                                                                                 |
| expirationDate          | _string_ date string in format `yyyy-MM-dd`                                                                |
| intakeExpectedEndDate   | _string_ date string in format `yyyy-MM-dd`                                                                |
| firstPaymentAmount      | _decimal(18,2)_                                                                                            |
| firstPaymentDate        | _string_ date string in format `yyyy-MM-dd`                                                                |
| secondPaymentAmount     | _decimal(18,2)_                                                                                            |
| secondPaymentDate       | _string_ date string in format `yyyy-MM-dd`                                                                |
| tuitionFees             | _decimal(18,2)_                                                                                            |
| ancillaryFees           | _decimal(18,2)_                                                                                            |
| hasFinancialAid         | _boolean_                                                                                                  |
| financialAidDescription | _string_ (min 1, max 100) ([required] if hasFinancialAid == `true`)                                        |
| conditions              | Array[0..5] of [OfferCondition](#offercondition)                                                           |
| offerLetter             | [BinaryDocument](#binarydocument)                                                                          |
| timestamp               | _string_ ISO 8601 Date Formatted String                                                                    |
| by                      | _string_ (min 1, max 255)                                                                                  |
| futureIntake            | _[nullable]_ [Intake](#intake) (Can not include an english Program.)                                       |

**_Example:_**

```JSON
{
  "applicationNumber" : "X1484934",
  "campusCode" : "C4",
  "deliveryOption" : "fulltime",
  "programCode" : "TST1DG5",
  "startDate" : "2018-01-01",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
  "state" : "Sent",
  "isExchange" : true,
  "internshipType" : "notavailable",
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
  "conditions": [],
  "offerLetter" : {
    "id": "00000000-0000-0000-0000-000000000000",
    "link": "https://someurltodownloadfile",
    "name": "filename.jpg",
    "mimeType": "image/jpeg",
    "uploaded": "2017-12-08T17:19:02.3269001Z",
    "uploadedBy": "Jane Smith"
  },
  "timestamp" : "2017-12-08T17:19:02.3269001Z",
  "by" : "John Doe",
  "futureIntake": {
    "campusCode" : "C4",
    "deliveryOption" : "fulltime",
    "programCode" : "TST1DG5",
    "startDate" : "2018-01-01",
    "intakeId" : "00000000-0000-0000-0000-000000000000"
  }
}
```

XML Example: See [Appendix: OfferCreated](#appendix-offercreated)

### OfferCondition ###

| Property           | Type                                                          |
| ------------------ | ------------------------------------------------------------- |
| offerConditionType | _string_ ([Lookup](#offerconditiontype))                      |
| other              | _[nullable] string_ (min 1, max 255) set when type is `other` |

### OfferDeclined ###

| Property          | Type                                        |
| ----------------- | ------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                    |
| campusCode        | _string_ (min 1, max 4)                     |
| deliveryOption    | _string_ ([Lookup](#intakedeliveryoption))  |
| programCode       | _string_ (min 1, max 10)                    |
| startDate         | _string_ date string in format `yyyy-MM-dd` |
| intakeId          | _string_ guid                               |
| timestamp         | _string_ ISO 8601 Date Formatted String     |
| by                | _string_ (min 1, max 255)                   |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2017-01-20",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
  "timestamp" : "2017-12-08T17:19:02.3269001Z",
  "by" : "John Doe"
}
```

### OfferPreRegistered ###

| Property          | Type                                        |
| ----------------- | ------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                    |
| campusCode        | _string_ (min 1, max 4)                     |
| deliveryOption    | _string_ ([Lookup](#intakedeliveryoption))  |
| programCode       | _string_ (min 1, max 10)                    |
| startDate         | _string_ date string in format `yyyy-MM-dd` |
| intakeId          | _string_ guid                               |
| timestamp         | _string_ ISO 8601 Date Formatted String     |
| by                | _string_ (min 1, max 255)                   |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2017-01-20",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
  "timestamp" : "2017-12-08T17:19:02.3269001Z",
  "by" : "John Doe"
}
```

### OfferRevoked ###

| Property          | Type                                        |
| ----------------- | ------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                    |
| campusCode        | _string_ (min 1, max 4)                     |
| deliveryOption    | _string_ ([Lookup](#intakedeliveryoption))  |
| programCode       | _string_ (min 1, max 10)                    |
| startDate         | _string_ date string in format `yyyy-MM-dd` |
| intakeId          | _string_ guid                               |
| timestamp         | _string_ ISO 8601 Date Formatted String     |
| by                | _string_ (min 1, max 255)                   |
| revokeType        | _string_ ([Lookup](#offerrevoketype))       |
| otherReason       | _[nullable] string_ (min 1, max 100)        |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2017-01-20",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
  "timestamp" : "2017-12-08T17:19:02.3269001Z",
  "by" : "John Doe",
  "revokeType" : "other",
  "otherReason" : "something that isn't covered in the list of common responses"
}
```

### OfferWithdrawn ###

| Property          | Type                                                                                                       |
| ----------------- | ---------------------------------------------------------------------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                                                                                   |
| campusCode        | _string_ (min 1, max 4) _[nullable]_ if intakeId is provided                                               |
| deliveryOption    | _string_ ([Lookup](#intakedeliveryoption)) _[nullable]_ if intakeId is provided                            |
| programCode       | _string_ (min 1, max 10) _[nullable]_ if intakeId is provided                                              |
| startDate         | _string_ date string in format `yyyy-MM-dd` _[nullable]_ if intakeId is provided                           |
| intakeId          | _[nullable] string_ guid if provided, then campusCode-deliveryOption-programCode-startDate must be null    |
| timestamp         | _string_ ISO 8601 Date Formatted String                                                                    |
| by                | _string_ (min 1, max 255)                                                                                  |
| withdrawnType     | _string_ ([Lookup](#withdrawtype))                                                                         |
| otherReason       | _[null if withdrawnType != other] string_ (min 1, max 100)                                                 |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2018-01-20",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
  "withdrawnType" : "visadeclined",
  "otherReason" : null,
  "timestamp" : "2017-12-08T17:19:02.3269001Z",
  "by" : "John Doe"
}
```

### OfferPaymentReceipt ###

| Property                | Type                                                                                                                 |
| ----------------------- | -------------------------------------------------------------------------------------------------------------------- |
| applicationNumber       | _string_ (min 1, max 20)                                                                                             |
| campusCode              | _string_ (min 1, max 4) _[nullable]_ if intakeId is provided                                                         |
| deliveryOption          | _string_ ([Lookup](#intakedeliveryoption)) _[nullable]_ if intakeId is provided                                      |
| programCode             | _string_ (min 1, max 10) _[nullable]_ if intakeId is provided                                                        |
| startDate               | _string_ date string in format `yyyy-MM-dd` _[nullable]_ if intakeId is provided                                     |
| intakeId                | _[nullable] string_ guid if provided, then campusCode-deliveryOption-programCode-startDate must be null              |
| receipt                 | _[nullable]_ [NewBinaryDocumentInfo](#newbinarydocumentinfo) cannot provide both 'receipt' and 'generateReceiptInfo' |
| generateReceiptInfo     | _[nullable]_ [NewPaymentReceiptInfo](#newpaymentreceiptinfo)                                                         |
| sendReceiptNotification | _[nullable] boolean_ will send an e-mail notification to the applicant/agent indicating receipt is attached to offer |

**_Notes:_**

For 'sendReceiptNotification', null and false are treated the same. Only a true
value will send the e-mail notification.

When using this object for the **AddOfferPaymentReceipt** event, the offer must
be in the Paid or PreRegistered state. Unlike PayOffer, this will not transition
the offer state, and can be called repeatedly (no limit). You must provide one of
'receipt' or 'generateReceiptInfo' with this event (but not both).

When using this object for the **PayOffer** event, the offer must be in the Sent
or Accepted state. This event can only be called once, because it transitions the
offer state into Paid.

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2018-01-20",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
  "receipt" : null
}
```

XML Example: See [Appendix: OfferPaymentReceipt](#appendix-offerpaymentreceipt)

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

### PreAdmitOfferAccepted ###

| Property          | Type                                                              |
| ----------------- | ----------------------------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                                          |
| campusCode        | _string_ (min 1, max 4)                                           |
| deliveryOption    | _string_ ([Lookup](#intakedeliveryoption))                        |
| programCode       | _string_ (min 1, max 10)                                          |
| startDate         | _string_ date string in format `yyyy-MM-dd`                       |
| intakeId          | _string_ guid                                                     |
| timestamp         | _string_ ISO 8601 Date Formatted String                           |
| by                | _string_ (min 1, max 255)                                         |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2017-01-20",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
  "timestamp" : "2017-12-08T17:19:02.3269001Z",
  "by" : "John Doe"
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

### ProgramDecision ###

| Property            | Type                                                                      |
| ------------------- | ------------------------------------------------------------------------- |
| state               | _string_ ([Lookup](#programdecisionstate))                                |
| declineReasonCode   | _[nullable] string_ ([Lookup](#programdeclinereason))                     |
| declineReasonOther  | _[nullable] string_ (min 1, max 100)                                      |

Example: See [Appendix: ApplicationFull](#appendix-applicationfull)

### ProgramSelection ###

| Property            | Type                                                                      |
| ------------------- | ------------------------------------------------------------------------- |
| term                | [Term](#term)                                                             |
| program             | [Program](#program)                                                       |
| preferredCampusCode | _[nullable] string_ (min 1, max 4) (college assigned Campus Code)         |
| preferredIntakeId   | _[nullable] string_ Intake selected                                       |
| choiceNumber        | _number_ (less than 0 = EAP/ESL Program, greater than 0 = Normal Program) |
| decision            | _[nullable]_ [ProgramDecision](#programdecision)                          |

Example: See [Appendix: ApplicationFull](#appendix-applicationfull)

### ProgramSelectionDecisionUpdated ###

| Property           | Type                                                  |
| ------------------ | ----------------------------------------------------- |
| applicationNumber  | _string_ (min 1, max 20)                              |
| applicationCycle   | _number_ ([Lookup](#applicationcycle))                |
| programCode        | _string_ (min 1, max 10)                              |
| term               | _string_ ([Lookup](#termcode))                        |
| state              | _string_ ([Lookup](#programdecisionstate))            |
| declineReasonCode  | _[nullable] string_ ([Lookup](#programdeclinereason)) |
| declineReasonOther | _[nullable] string_ (min 1, max 100)                  |
| timestamp          | _string_ ISO 8601 Date Formatted String               |
| by                 | _string_ (min 1, max 255)                             |

**_Example:_**

```JSON
{
  "applicationNumber" : "X1484934",
  "applicationCycle" : 2017,
  "by" : "John Doe",
  "term" : "spring",
  "state" : "Declined",
  "programCode" : "TST1DG5",
  "declineReasonCode" : "other",
  "declineReasonOther" : "Unspecified",
  "timestamp" : "2017-12-08T17:19:02.3269001Z"
}
```

### ProgramSelectionDeclined ###

| Property           | Type                                       |
| ------------------ | ------------------------------------------ |
| applicationNumber  | _string_ (min 1, max 20)                   |
| applicationCycle   | _number_ ([Lookup](#applicationcycle))     |
| programCode        | _string_ (min 1, max 10)                   |
| term               | _string_ ([Lookup](#termcode))             |
| declineReasonCode  | _string_ ([Lookup](#programdeclinereason)) |
| declineReasonOther | _[nullable] string_ (min 1, max 100)       |
| timestamp          | _string_ ISO 8601 Date Formatted String    |
| by                 | _string_ (min 1, max 255)                  |

**_Example:_**

```JSON
{
  "applicationNumber" : "X1484934",
  "applicationCycle" : 2017,
  "by" : "John Doe",
  "term" : "spring",
  "programCode" : "TST1DG5",
  "declineReasonCode" : "other",
  "declineReasonOther" : "Unspecified",
  "timestamp" : "2017-12-08T17:19:02.3269001Z"
}
```

### Referrals ###

| Property        | Type                                  |
| --------------- | ------------------------------------- |
| exchangePartner | [ExchangePartner](#exchangepartner)   |

**_Example:_**

```JSON
{
  "exchangePartner": {
      "name": "Test College 1",
      "sisIdentifier": "TST1"
    }
}
```

### RevokeOffer ###

| Property          | Type                                                                                                       |
| ----------------- | ---------------------------------------------------------------------------------------------------------- |
| applicationNumber | _string_ (min 1, max 20)                                                                                   |
| campusCode        | _string_ (min 1, max 4) _[nullable]_ if intakeId is provided                                               |
| deliveryOption    | _string_ ([Lookup](#intakedeliveryoption)) _[nullable]_ if intakeId is provided                            |
| programCode       | _string_ (min 1, max 10) _[nullable]_ if intakeId is provided                                              |
| startDate         | _string_ date string in format `yyyy-MM-dd` _[nullable]_ if intakeId is provided                           |
| intakeId          | _[nullable] string_ guid if provided, then campusCode-deliveryOption-programCode-startDate must be null    |
| revokeType        | _string_ ([Lookup](#offerrevoketype))                                                                      |
| otherReason       | _[nullable] string_ (min 1, max 100)                                                                       |

**_Example:_**

```JSON
{
  "applicationNumber" : "X12345",
  "campusCode" : "main",
  "deliveryOption" : "fulltime",
  "programCode" : "TSTAD1",
  "startDate" : "2018-01-20",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
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
  "data": { }
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

| Property                | Type                                                                                                       |
| ----------------------- | ---------------------------------------------------------------------------------------------------------- |
| applicationNumber       | _string_ (min 1, max 20)                                                                                   |
| campusCode              | _string_ (min 1, max 4) _[nullable]_ if intakeId is provided                                               |
| deliveryOption          | _string_ ([Lookup](#intakedeliveryoption)) _[nullable]_ if intakeId is provided                            |
| programCode             | _string_ (min 1, max 10) _[nullable]_ if intakeId is provided                                              |
| startDate               | _string_ date string in format `yyyy-MM-dd` _[nullable]_ if intakeId is provided                           |
| intakeId                | _[nullable] string_ guid if provided, then campusCode-deliveryOption-programCode-startDate must be null    |
| studentId               | _[nullable] string_ (min 1, max 30)                                                                        |
| isPreAdmit              | _boolean_                                                                                                  |
| entryLevelType          | _[nullable] string_ ([Lookup](#entryleveltype))                                                            |
| isExchange              | _[nullable] boolean_                                                                                       |
| internshipType          | _[nullable] string_ ([Lookup](#internshiptype))                                                            |
| internshipLength        | _[nullable] decimal(18,1)_ ([required] if internshipType == `optional` or `required` or `unpaidplacement`) |
| internshipDescription   | _[nullable] string_ (min 1, max 100)                                                                       |
| instructionHours        | _[nullable] decimal(18,1)_                                                                                 |
| expirationDate          | _[nullable] string_ date string in format `yyyy-MM-dd`                                                     |
| intakeExpectedEndDate   | _[nullable] string_ date string in format `yyyy-MM-dd`                                                     |
| firstPaymentAmount      | _[nullable] decimal(18,2)_                                                                                 |
| firstPaymentDate        | _[nullable] string_ date string in format `yyyy-MM-dd`                                                     |
| secondPaymentAmount     | _[nullable] decimal(18,2)_                                                                                 |
| secondPaymentDate       | _[nullable] string_ date string in format `yyyy-MM-dd`                                                     |
| tuitionFees             | _[nullable] decimal(18,2)_                                                                                 |
| ancillaryFees           | _[nullable] decimal(18,2)_                                                                                 |
| hasFinancialAid         | _boolean_                                                                                                  |
| financialAidDescription | string_ (min 1, max 100) ([required] if hasFinancialAid == `true`)                                         |
| conditions              | Array[0..5] of [OfferCondition](#offercondition)                                                           |
| customOfferLetter       | _[nullable]_ [NewBinaryDocumentInfo](#newbinarydocumentinfo)                                               |
| futureIntake            | _[nullable]_ [Intake](#intake) (Can not include an english Program.)                                       |

**_Example:_**

```JSON
{
  "applicationNumber" : "X1484934",
  "campusCode" : "C4",
  "deliveryOption" : "fulltime",
  "programCode" : "TST1DG5",
  "startDate" : "2018-01-01",
  "intakeId" : "00000000-0000-0000-0000-000000000000",
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
  "customOfferLetter" : {},
  "futureIntake": {
    "campusCode" : "C4",
    "deliveryOption" : "fulltime",
    "programCode" : "TST1DG5",
    "startDate" : "2018-01-01",
    "intakeId" : "00000000-0000-0000-0000-000000000000"
  }
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
otherwise the IAS will generate an offer letter on your behalf.

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

### ApplicationEnglishProficiency ###

| Code                   |
| ---------------------- |
| Completed              |
| InProgressTest         |
| InProgressStudyProgram |
| EnrollEnglishPlus      |
| EnrollEnglishOnly      |
| EnglishFirstLanguage   |

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

| Code               |
| ------------------ |
| required           |
| optional           |
| notavailable       |
| unpaidplacement    |
| requiredinternship |
| industryplacement  |
| fieldplacement     |

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

| Code        |
| ----------- |
| deadline    |
| nopayment   |
| noshow      |
| noseats     |
| novisa      |
| visadelayed |
| transfer    |
| other       |

### OfferState ###

| Code             |
| ---------------- |
| PreAdmitted      |
| PreAdmitAccepted |
| Sent             |
| Accepted         |
| Paid             |
| PreRegistered    |
| Withdrawn        |
| Revoked          |
| Declined         |

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

### ProgramDecisionState ###

| Code             |
| ---------------- |
| Declined         |
| None             |
| Offer            |
| PreAdmitted      |
| Waitlisted       |


### ProgramDeclineReason ###

| Code                 |
| -------------------- |
| admissionrequirement |
| alternateoffer       |
| alternatedecision    |
| intakefull           |
| programsuspended     |
| programcancelled     |
| other                |

### ReceiptType ###

| Code     |
| -------- |
| Deposit  |
| Tuition  |

### SchoolType ###

| Code       |
| ---------- |
| secondary  |
| college    |
| university |

### ScreeningStatus ###

| Code                         |
| ------                       |
| NotScreened                  |
| InitialScreeningComplete *   |
| SecondaryScreeningComplete * |
| Screened                     |
| ScreeningFailed              |

_*Note:*_ InitialScreeningComplete and SecondaryScreening complete are only available when 
the multiLevelScreening feature is turned on for your college.  Screened (date) is only supplied
when ScreeningStatus == Screened

### SisInboundEventType ###

| Key                                       | Data Object Type                                                    | Parent Event(s)                             |
| ----------------------------------------- | ------------------------------------------------------------------- | ------------------------------------------- |
| ApplicantProfileUpdated                   | [Applicant](#applicant)                                             | ApplicationScreened or ApplicationSubmitted |
| ApplicationScreened                       | [ApplicationFull](#applicationfull)                                 |                                             |
| ApplicationSubmitted                      | [ApplicationFull](#applicationfull)                                 |                                             |
| ApplicationUpdated                        | [Application](#application)                                         |                                             |
| ApplicationClosed                         | [ApplicationFull](#applicationfull)                                 |                                             |
| PreAdmitOfferAccepted                     | [PreAdmitOfferAccepted](#preadmitofferaccepted)                     |                                             |
| OfferAccepted                             | [OfferAccepted](#offeraccepted)                                     |                                             |
| OfferCreated                              | [OfferDetails](#offerdetails)                                       |                                             |
| OfferDeclined                             | [OfferDeclined](#offerdeclined)                                     |                                             |
| OfferUpdated                              | [OfferDetails](#offerdetails)                                       |                                             |
| OfferRevoked                              | [OfferRevoked](#offerrevoked)                                       |                                             |
| OfferWithdrawn                            | [OfferWithdrawn](#offerwithdrawn)                                   |                                             |
| OfferPreRegistered                        | [OfferPreRegistered](#offerpreregistered)                           |                                             |
| ~~ProgramSelectionsUpdated~~ (deprecated) | [Application](#application)                                         | ApplicationScreened or ApplicationSubmitted |
| ~~ProgramSelectionDeclined~~ (deprecated) | [ProgramSelectionDeclined](#programselectiondeclined)               | ApplicationScreened or ApplicationSubmitted |
| ProgramDecisionUpdated                    | [ProgramSelectionDecisionUpdated](#programselectiondecisionupdated) | ApplicationScreened or ApplicationSubmitted |

_*Special Note for Parent Event(s):*_ These two events are dependent on being subscribed
to the parent event. This means you have to be subscribed to at least one of the
parent events. These events also behave slightly different depending on which parent
event you are subscribed to.

E.g. If you are subscribed to the ApplicationScreened, then you will not receive any
ApplicantProfileUpdates or ProgramSelectionUpdates until the application has had
it's screened flag marked. This eliminates unnecessary notifications for events that
you might receive during the screening process.

### SisOutboundEventType ###

| Key                           | Data Object Type                                    |
| ----------------------------- | --------------------------------------------------- |
| CreateOffer                   | [NewOfferInfo](#newofferinfo)                       |
| UpdateOffer                   | [UpdateOffer](#updateoffer)                         |
| DeclineProgramSelection       | [DeclineProgramSelection](#declineprogramselection) |
| PayOffer                      | [OfferPaymentReceipt](#offerpaymentreceipt)         |
| AddOfferPaymentReceipt        | [OfferPaymentReceipt](#offerpaymentreceipt)         |
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
| credential-secondary  | seniorexamcertificate  |
| credential-secondary  | gcsecertificate        |
| credential-secondary  | necoexamcertificate    |
| credential-secondary  | necoscratchcardinfo    |
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
| other                 | depositproof           |
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
| visadelayed  |
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
required to write and read events respectively.

| Name              | Type    | Purpose                  |
| ----------------- | ------- | ------------------------ |
| SisOutboundEvents | _table_ | Sis Outbound Event Queue |
| SisInboundEvents  | _table_ | Sis Inbound Event Queue  |

#### SisInboundEvents Schema ####

| Column Name | Column Type    | Purpose                       |
| ----------- | -------------- | ----------------------------- |
| id          | _bigint_       | Event Unique Primary Key      |
| eventInfo   | _nvarchar(max)_ | Event Payload Data            |
| eventFormat | _nvarchar(5)_   | Event Format Type (json, xml) |
| createdDate | _datetime2_    | Created Date                  |

#### SisOutboundEvents Schema ####

| Column Name      | Column Type    | Purpose                             |
| ---------------- | -------------- | ----------------------------------- |
| id               | _bigint_       | Event Unique Primary Key            |
| status           | _nvarchar(50)_  | Event Status (Default: Pending)     |
| type             | _nvarchar(50)_  | [Event Type](#sisoutboundeventtype) |
| eventInfo        | _nvarchar(max)_ | Event Payload Data                  |
| eventFormat      | _nvarchar(5)_   | Event Format Type (json, xml)       |
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
| E0050  | Unauthorized Error                        | 
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

### Maintenance Error Message ###

When the system is under maintenance, API calls will respond with a 503 - Service Unavailable HTTP status code.  As well, the response will contain the same message that the college portal is displaying.

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
   Host: <IAS>.ca
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
- SisInboundEventType.ApplicationClosed

The ApplicationFull object includes a variety of Applicant and Application data.
Note: Empty JSON collections are not represented within the XML.

#### ApplicationFull Submitted JSON ####

```JSON
{
  "id": "85aee8dc-3bdc-e711-8737-e4b318b38df4",
  "number": "X1485152",
  "agency": {
    "name": "Agency Test",
    "sisIdentifier": "ABC123",
    "id": "083d06b1-4224-4003-919a-fd9fedff428a"
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
    "countryOfBirth": "ET",
    "primaryLanguage": "EN",
    "passportNumber": "AB1234567",
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
      "spokenLanguage": "gv"
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
            "id": "00000000-0000-00C0-0000-0000C0000001",
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
            "id": "00000000-0000-0F00-0000-000000000006",
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
            "id": "00000C00-0000-0000-0000-000000000000",
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
            "id": "00000000-0000-0000-0000-000000000001",
            "link": "https://somelinktodocument",
            "name": "my-testscore-pg1.pdf",
            "mimeType": "application/pdf",
            "uploaded": "2017-12-08T16:22:02.3269001Z",
            "uploadedBy": "Beth Smith"
          },
          {
            "id": "00000000-0000-0A00-0000-00000000000",
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
      "preferredIntakeId": null,
      "choiceNumber": -1,
	  "decision": {
		"state": "declined",
		"declineReasonCode": "alternateoffer",
		"declineReasonOther": null
	  }	  
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
      "preferredIntakeId": null,
      "choiceNumber": 1,
	  "decision": null
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
      "preferredIntakeId": null,
      "choiceNumber": 2,
	  "decision": null
    }
  ],
  "referrals": {
    "exchangePartner": {
      "name": "Test College 1",
      "sisIdentifier": "TST1"
    }
  }, 
  "applicationUrl": "https://international.ocas.ca/college/c/c921f1c6-ce09-43d1-a3ed-12dda3cbc706/applications/2cdc89de-3160-e811-80c3-0003ffb4c403",
  "applicationEnglishProficiency": "EnglishFirstLanguage",  
  "screeningStatus": "Screened",
  "screened": null,
  "submitted": "2017-12-09T11:19:46.6378594Z",
  "created": "2017-12-08T17:19:02.3269001Z",
  "updated": "2017-12-10T11:19:46.6378594Z",
  "by": "Esperanza Abe Lexus Jeromy Edmond Kristian Alan Henry Medhurst",
  "timestamp": "2017-12-09T11:19:46.6378594Z"
}
```

#### ApplicationFull Submitted XML ####

```XML
<root>
  <id>85aee8dc-3bdc-e711-8737-e4b318b38df4</id>
  <number>X1485152</number>
  <agency>
    <name>Agency Test</name>
    <sisIdentifier>ABC123</sisIdentifier>
    <id>083d06b1-4224-4003-919a-fd9fedff428a</id>
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
    <countryOfBirth>ET</countryOfBirth>
    <primaryLanguage>EN</primaryLanguage>
    <passportNumber>AB1234567</passportNumber>
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
      <spokenLanguage>gv</spokenLanguage>
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
            <id>00000000-0000-00C0-0000-0000C0000001</id>
            <link>https://somelinktodocument</link>
            <name>my-university-proof.pdf</name>
            <mimeType>application/pdf</mimeType>
            <uploaded>2017-12-08T16:19:02.3269001Z</uploaded>
            <uploadedBy>Beth Smith</uploadedBy>
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
            <id>00000000-0000-0F00-0000-000000000006</id>
            <link>https://somelinktodocument</link>
            <name>my-college-proof.pdf</name>
            <mimeType>application/pdf</mimeType>
            <uploaded>2017-12-08T16:19:02.3269001Z</uploaded>
            <uploadedBy>Beth Smith</uploadedBy>
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
            <id>00000C00-0000-0000-0000-000000000000</id>
            <link>https://somelinktodocument</link>
            <name>my-secondary-proof.pdf</name>
            <mimeType>application/pdf</mimeType>
            <uploaded>2017-12-08T16:19:02.3269001Z</uploaded>
            <uploadedBy>Beth Smith</uploadedBy>
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
            <id>00000000-0000-0000-0000-000000000001</id>
            <link>https://somelinktodocument</link>
            <name>my-testscore-pg1.pdf</name>
            <mimeType>application/pdf</mimeType>
            <uploaded>2017-12-08T16:22:02.3269001Z</uploaded>
            <uploadedBy>Beth Smith</uploadedBy>
          </item>
          <item>
            <id>00000000-0000-0A00-0000-00000000000</id>
            <link>https://somelinktodocument</link>
            <name>my-testscore-pg2.pdf</name>
            <mimeType>application/pdf</mimeType>
            <uploaded>2017-12-08T16:22:32.3269001Z</uploaded>
            <uploadedBy>Beth Smith</uploadedBy>
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
      <preferredIntakeId />
      <choiceNumber>-1</choiceNumber>
	  <decision>
		<state>declined</state>
		<declineReasonCode>alternateoffer</declineReasonCode>
		<declineReasonOther />
	  </decision>	  
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
      <preferredIntakeId />
      <choiceNumber>1</choiceNumber>
	  <decision />
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
      <preferredIntakeId />
      <choiceNumber>2</choiceNumber>
	  <decision />
    </item>
  </selections>
  <applicationUrl>https://international.ocas.ca/college/c/c921f1c6-ce09-43d1-a3ed-12dda3cbc706/applications/2cdc89de-3160-e811-80c3-0003ffb4c403</applicationUrl>
  <applicationEnglishProficiency>EnglishFirstLanguage</applicationEnglishProficiency>
  <screeningStatus>Screened</screeningStatus>
  <screened />
  <referrals>
    <exchangePartner>
      <name>Test College 1</name>
      <sisIdentifier>TST1</sisIdentifier>
    </exchangePartner>
  </referrals>  
  <submitted>2017-12-09T11:19:46.6378594Z</submitted>
  <created>2017-12-08T17:19:02.3269001Z</created>
  <updated>2017-12-10T11:19:46.6378594Z</updated>  
  <by>Esperanza Abe Lexus Jeromy Edmond Kristian Alan Henry Medhurst</by>
  <timestamp>2017-12-09T11:19:46.6378594Z</timestamp>
</root>
```

### Appendix: Application ###

Used by:
- SisInboundEventType.ApplicationUpdated
- ~~SisInboundEventType.ProgramSelectionsUpdated~~ (deprecated)

#### Application Submitted JSON ####

```JSON
{
  "id": "85aee8dc-3bdc-e711-8737-e4b318b38df4",
  "number": "X1485152",
  "agency": {
    "name": "Agency Test",
    "sisIdentifier": "ABC123",
    "id": "083d06b1-4224-4003-919a-fd9fedff428a"
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
      "preferredIntakeId": null,
      "choiceNumber": -1,
	  "decision": {
		"state": "declined",
		"declineReasonCode": "alternateoffer",
		"declineReasonOther": null
	  }
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
      "preferredIntakeId": null,
      "choiceNumber": 1,
	  "decision": null
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
      "preferredIntakeId": null,
      "choiceNumber": 2,
	  "decision": null
    }
  ],
  "referrals": {
    "exchangePartner": {
      "name": "Test College 1",
      "sisIdentifier": "TST1"
    }
  }, 
  "applicationUrl": "https://international.ocas.ca/college/c/c921f1c6-ce09-43d1-a3ed-12dda3cbc706/applications/2cdc89de-3160-e811-80c3-0003ffb4c403,
  "applicationEnglishProficiency": "applicationEnglishFirstLanguage",  
  "screeningStatus": "screened",
  "screened": null,
  "submitted": "2017-12-09T11:19:46.6378594Z",
  "created": "2017-12-08T17:19:02.3269001Z",
  "by": "Esperanza Abe Lexus Jeromy Edmond Kristian Alan Henry Medhurst",
  "timestamp": "2017-12-09T11:19:46.6378594Z"
}
```

#### Application XML ####

```XML
<root>
  <id>85aee8dc-3bdc-e711-8737-e4b318b38df4</id>
  <number>X1485152</number>
  <agency>
    <name>Agency Test</name>
    <sisIdentifier>ABC123</sisIdentifier>
    <id>083d06b1-4224-4003-919a-fd9fedff428a</id>
  </agency>  
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
      <preferredIntakeId />
      <choiceNumber>-1</choiceNumber>
	  <decision>
		<state>declined</state>
		<declineReasonCode>alternateoffer</declineReasonCode>
		<declineReasonOther />
	  </decision>
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
      <preferredIntakeId />
      <choiceNumber>1</choiceNumber>
	  <decision />
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
      <preferredIntakeId />
      <choiceNumber>2</choiceNumber>
	  <decision />
    </item>
  </selections>
  <applicationUrl>https://international.ocas.ca/college/c/c921f1c6-ce09-43d1-a3ed-12dda3cbc706/applications/2cdc89de-3160-e811-80c3-0003ffb4c403</applicationUrl>
  <applicationEnglishProficiency>EnglishFirstLanguage</applicationEnglishProficiency>
  <screeningStatus>Screened</screeningStatus>
  <screened />
  <referrals>
    <exchangePartner>
      <name>Test College 1</name>
      <sisIdentifier>TST1</sisIdentifier>
    </exchangePartner>
  </referrals>  
  <submitted>2017-12-09T11:19:46.6378594Z</submitted>
  <created>2017-12-08T17:19:02.3269001Z</created>
  <by>Esperanza Abe Lexus Jeromy Edmond Kristian Alan Henry Medhurst</by>
  <timestamp>2017-12-09T11:19:46.6378594Z</timestamp>
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
  },
  "futureIntake": null
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
  <futureIntake />
</root>
```

### Appendix: OfferCreated ###

#### OfferCreated JSON ####

```JSON
{
  "applicationNumber" : "X1484934",
  "campusCode" : "C4",
  "deliveryOption" : "fulltime",
  "programCode" : "TST1DG5",
  "intakeId": "00000000-0000-0000-0000-000000000000",
  "state" : "Sent",
  "startDate" : "2018-06-25",
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
  "offerLetter" : {
    "id": "00000000-0000-0000-0000-000000000000",
    "link": "https://someurltodownloadfile",
    "name": "myofferletter.pdf",
    "mimeType": "application/pdf",
    "uploaded": "2018-12-08T16:22:01Z",
    "uploadedBy": "Jane Smith"
  },
  "timestamp" : "2018-03-07T16:22:02Z",
  "by" : "Beth MacDonald"
}
```

#### OfferCreated XML ####

```XML
<root>
  <applicationNumber>X1484934</applicationNumber>
  <campusCode>C4</campusCode>
  <deliveryOption>fulltime</deliveryOption>
  <programCode>TST1DG5</programCode>
  <intakeId>00000000-0000-0000-0000-000000000000</intakeId>
  <state>Sent</state>
  <startDate>2018-06-25</startDate>
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
  <offerLetter>
    <id>00000000-0000-0000-0000-000000000000</id>
    <link>https://somelinktodocument</link>
    <name>myofferletter.pdf</name>
    <mimeType>application/pdf</mimeType>
    <uploaded>2018-12-08T16:22:01Z</uploaded>
    <uploadedBy>Beth Smith</uploadedBy>
  </offerLetter>
  <timestamp>2018-03-07T16:22:02Z</timestamp>
  <by>Beth MacDonald</by>
  <futureIntake>
    <campusCode>C4</campusCode>
    <deliveryOption>fulltime</deliveryOption>
    <programCode>TST1DG5</programCode>
    <startDate>2019-06-25</startDate>
  </futureIntake>
</root>
```

### Appendix: OfferPaymentReceipt ###

#### OfferPaymentReceipt JSON ####

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
  },
  "generateReceiptInfo": null,
  "sendReceiptNotification": true
}
```

#### OfferPaymentReceipt XML ####

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
  <sendReceiptNotification>true</sendReceiptNotification>
</root>
```

### Appendix: RevokeOffer ###

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