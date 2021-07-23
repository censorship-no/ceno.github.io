# CENO Browser
- [Current status](#current-status)
- [What works](#what-works)
- [Accessing personalized websites](#accessing-personalized-websites)
- [What does not work (yet!)](#what-does-not-work-yet)
- [Help by becoming a bridge!](#help-by-becoming-a-bridge)
- [Feedback](#feedback)

CENO is a web browser for the Android operating system designed to circumvent
censorship by routing traffic through intermediate ephemeral nodes (bridges).
Once the content is in the censored zone - and if it's not private - it is
then further distributed by those nodes in a BitTorrent like fashion.

## Current status

CENO is currently in its first stable production release (v.1.0.1). It is being tested in censored countries
and being given a UI overhaul.

## What works

Basic functionality is in place and is currently being tested. Provided that
there are enough bridges outside of censored countries, and that those countries
haven't sealed off their international communication completely, CENO users are
able to connect to blocked websites and then share the content to other peers.

When users start the CENO browser, they automatically become part of the CENO
network. This means that - when possible - these devices shall act as temporary
VPNs for people who can't access blocked websites.

In addition, any publicly available content that any CENO user visits shall be
shared in a BitTorrent-like fashion to others.

## Accessing personalized websites

To access personalized websites (those that require login and password) such
as google, twitter, facebook etc; users currently need to do it from inside
the Incognito window. This is because by default CENO strips down all
personal information from HTTP requests to ensure no such data is leaked to the
distributed cache.

When users access websites through the Incognito window, the CENO browser
does not strip this information down and all communication is then end-to-end encrypted with the destination server.

## What does not work (yet)

Here is a list of important information CENO users need to know:

### Battery and data usage

To prolong availability of CENO bridges, the CENO browser shall continue
working even when it goes to the background. We have not yet put in place
functionality which would disable all networking operations when the device
switches to cellular internet, nor when it is disconnected from the charger.

Until we implement this functionality, to preserve the device battery and
network bandwidth, users need to explicitly disable CENO either by shutting it
down from Android's list of running applications, or by tapping the "Tap to
stop CENO" button from the notification area.

### CENO is not an anonymizer!

CENO users should also be aware of the fact that CENO is not a network to
anonymize users - such as Tor or I2P. More akin to BitTorrent, IP addresses or
users sharing particular content are publicly visible by anyone understanding
the internals of the BitTorrent DHT protocol.

### Complete blackout

At the moment, CENO relies on bridge nodes whose IP addesses are not black-listed by countries with harsh censorship (hence why support from ordinary people is so important to us). However, in the event of a complete internet blackout where no data can pass the international boundary, CENO will cease to work.

In the future we're hoping to address this problem by:

1. Letting users "import" web content by means other than the Internet into the
   censored zones and then disseminate it in a distributed fashion;
2. Modifying the protocol to find alternative routes to relay traffic
   outside of the censored country and back if one exists. 

## Help by becoming a bridge

As mentioned above, because random IP addresses are usually not blocked, CENO
relies on users outside of censored zones to act as bridges. Therefore we're asking that people willing to help the CENO project as well as people behind the internet walls to install CENO browser on an Android device, start it up, and let it run for as long as possible. [Learn more about becoming a Bridge!](https://censorship.no/user-manual/en/browser/bridging.html)

## Where to get it

Github:    https://github.com/censorship-no/ceno-browser/releases
Play Store: https://play.google.com/store/apps/details?id=ie.equalit.ceno
Paskoocheh: https://paskoocheh.com/tools/124/android.html

## Feedback

We welcome both positive and negative feedback, as well as questions at cenoers@equalit.ie.
