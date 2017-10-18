# Perfect-BCrypt

<p align="center">
    <a href="http://perfect.org/get-involved.html" target="_blank">
        <img src="http://perfect.org/assets/github/perfect_github_2_0_0.jpg" alt="Get Involed with Perfect!" width="854" />
    </a>
</p>

<p align="center">
    <a href="https://github.com/PerfectlySoft/Perfect" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_1_Star.jpg" alt="Star Perfect On Github" />
    </a>  
    <a href="http://stackoverflow.com/questions/tagged/perfect" target="_blank">
        <img src="http://www.perfect.org/github/perfect_gh_button_2_SO.jpg" alt="Stack Overflow" />
    </a>  
    <a href="https://twitter.com/perfectlysoft" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_3_twit.jpg" alt="Follow Perfect on Twitter" />
    </a>  
    <a href="http://perfect.ly" target="_blank">
        <img src="http://www.perfect.org/github/Perfect_GH_button_4_slack.jpg" alt="Join the Perfect Slack" />
    </a>
</p>

<p align="center">
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Swift-4.0-orange.svg?style=flat" alt="Swift 4.0">
    </a>
    <a href="https://developer.apple.com/swift/" target="_blank">
        <img src="https://img.shields.io/badge/Platforms-OS%20X%20%7C%20Linux%20-lightgray.svg?style=flat" alt="Platforms OS X | Linux">
    </a>
    <a href="http://perfect.org/licensing.html" target="_blank">
        <img src="https://img.shields.io/badge/License-Apache-lightgrey.svg?style=flat" alt="License Apache">
    </a>
    <a href="http://twitter.com/PerfectlySoft" target="_blank">
        <img src="https://img.shields.io/badge/Twitter-@PerfectlySoft-blue.svg?style=flat" alt="PerfectlySoft Twitter">
    </a>
    <a href="http://perfect.ly" target="_blank">
        <img src="http://perfect.ly/badge.svg" alt="Slack Status">
    </a>
</p>


## Acknowledgement
 
Perfect-BCrypt module is a Swift Wrapper of [bcrypt](https://github.com/pyca/bcrypt)

## Issues

We are transitioning to using JIRA for all bugs and support related issues, therefore the GitHub issues has been disabled.

If you find a mistake, bug, or any other helpful suggestion you'd like to make on the docs please head over to [http://jira.perfect.org:8080/servicedesk/customer/portal/1](http://jira.perfect.org:8080/servicedesk/customer/portal/1) and raise it.

A comprehensive list of open issues can be found at [http://jira.perfect.org:8080/projects/ISS/issues](http://jira.perfect.org:8080/projects/ISS/issues)

## Building

Add this project as a dependency in your Package.swift file.

```
.Package(url: "https://github.com/PerfectSideRepo/Perfect-BCrypt.git", 
majorVersion: 3)
```

## Quick Start


### `BCrypt.Salt()`

Generate a "salt" string, for example, `let salt = BCrypt.Salt()` will return something like `$2b$12$yfG5ZTnTjg.HcgcI2o6Nhe`

### `BCrypt.Hash()`

Generate shadow by password and salt. For example:

``` swift
let password = "Kk4DQuMMfZL9o"
let salt = "$2b$04$cVWp4XaNU8a4v1uMRum2SO"
let hashed = try BCrypt.Hash(password, salt: salt)

// the hashed result will be:
// "$2b$04$cVWp4XaNU8a4v1uMRum2SO026BWLIoQMD/TXg5uZV.0P.uO8m3YEm"
```


### `BCrypt.Check()`

Verify a password if matches with the previously generated hash:

``` swift
guard BCrypt.Check(password, hashed: shadow)) else {
	// Access Denied.
}
```

### `BCrypt.KDF()`

KDF is used in OpenSSH's newer encrypted private key format:

``` swift
let derived = try BCrypt.KDF("password", salt: "salt", 
desiredKeyBytes: 32, rounds: 4, ignoreFewRounds: true)

// derived will be a 32 byte UInt8 array
// 0x5b, 0xbf, 0x0c, 0xc2, 0x93, 0x58, 0x7f, 0x1c,
// 0x36, 0x35, 0x55, 0x5c, 0x27, 0x79, 0x65, 0x98,
// 0xd4, 0x7e, 0x57, 0x90, 0x71, 0xbf, 0x42, 0x7e,
// 0x9d, 0x8f, 0xbe, 0x84, 0x2a, 0xba, 0x34, 0xd9
```

## Further Information

For more documentation, please visit [perfect.org](http://www.perfect.org/docs/crypto.html).
