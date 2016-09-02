//
//  APIConstantsKeys.swift
//  mozioT
//
//  Created by Tasin Zarkoob on 01/09/16.
//  Copyright © 2016 Tasin. All rights reserved.
//

import Foundation

let APP_BASE_URL = ""
let ENDPOINT_ALLTEST = ""

let k_id = "id"
let k_title = "title"
let k_body = "body"
let k_value = "value"
let k_options = "options"
let k_questions = "questions"
let k_results = "results"
let k_totalValue = "totalVal"

let k_message = "message"
let k_status = "status"


// LOCAL DATA

let allTestJSON = "{\"status\":true,\"data\":[{    \"title\":\"Todd'sSyndrome\",    \"questions\":[    {        \"title\":\"ChooseGender?\",        \"body\":\"Thisletsusdecidethepossiblity\",        \"options\":[        {            \"title\":\"Male\",            \"value\":1        },        {            \"title\":\"Female\",            \"value\":0        }        ]    },    {        \"title\":\"ChooseGender?\",        \"body\":\"Thisletsusdecidethepossiblity\",        \"options\":[        {            \"title\":\"Male\",            \"value\":1},        {            \"title\":\"Female\",            \"value\":0        }        ]    }    ],    \"results\":[    {        \"title\":\"100%Likely\",        \"body\":\"100%Likely\",        \"value\":2    }    ]},{    \"title\":\"OtherExample\"}]}"

//"{\"status\": true,\"data\": [{    \"title\": \"Todd's Syndrome\"},{\"title\": \"Other Example\"}]}"