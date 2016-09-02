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

let allTestJSON = "{\"status\": true,\"data\": [{    \"title\": \"Todd's Syndrome\",    \"questions\": [    {        \"title\": \"Choose Gender \",        \"body\": \"Choose your gender?\",        \"options\": [        {            \"title\": \"Male\",            \"value\": 1        },        {            \"title\": \"Female\",            \"value\": 0        }        ]    },    {        \"title\": \"Age\",        \"body\": \"Are you age 16 or older?\",        \"options\": [        {            \"title\": \"YES\",            \"value\": 0        },        {            \"title\": \"NO\",            \"value\": 1        }        ]    },    {        \"title\": \"Migraine\",        \"body\": \"Do you suffer from migraines?\",        \"options\": [        {            \"title\": \"YES\",            \"value\": 1        },        {            \"title\": \"NO\",            \"value\": 0        }        ]    },    {        \"title\": \"hallucinogenic drugs\",        \"body\": \"Do you use any hallucinogenic drugs?\",        \"options\": [        {            \"title\": \"YES\",            \"value\": 1        },        {            \"title\": \"NO\",            \"value\": 0        }        ]    }    ],    \"results\": [    {        \"title\": \"0\",        \"body\": \"0% likely to have this disorder\",        \"value\": 0    },    {        \"title\": \"r\",        \"body\": \"50% probability to have this disorder\",        \"value\": 2    },    {        \"title\": \"r\",        \"body\": \"100% likely to have this disorder\",        \"value\": 4    }    ]},{    \"title\": \"Other Example\"}]}"

//"{\"status\": true,\"data\": [{    \"title\": \"Todd's Syndrome\"},{\"title\": \"Other Example\"}]}"