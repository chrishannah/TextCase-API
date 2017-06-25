# TextCase API

[![Travis](https://travis-ci.org/chrishannah/TextCase-API.svg?branch=master)](https://travis-ci.org/chrishannah/TextCase-API)
![Swift](https://img.shields.io/badge/Swift-3.1-red.svg)
[![Twitter](https://img.shields.io/badge/Twitter-@chrishannah-blue.svg)](http://twitter.com/chrishannah)

This is a basic API which can be used to request various different formats of a given string of text.

It uses the [Perfect](http://perfect.org) toolkit, and is actually just a learning project for myself. But a simple web server that can maybe provide a tiny amount of use, is another incentive to do it well.

The current options are:

- TitleCase
- Mocking SpongeBob

## Usage

### Title

Return a formatted version of a string of text, similar to [John Grubers TitleCase](https://daringfireball.net/2008/05/title_case), except implemented myself.

GET **/title/{input text}**

Example response:

    {
    "plain":"hello i am the TitleCase api",
    "title":"Hello I Am the TitleCase Api"
    }

### SpongeBob

Return a string formatted like the popular mocking SpongeBob memes. The results are random, so it's possible to get multiple formats for the same string.

GET **/spongebob/{input text}**

Example response:

    {
        "plain":"added mocking spongebob support",
        "spongebob":"aDded mocKinG SPongeBoB sUpPORT"
    }
