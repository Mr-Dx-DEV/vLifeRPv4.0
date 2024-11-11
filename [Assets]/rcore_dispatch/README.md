---
description: >-
    Step by step installation guide, config preview, locale preview, common issues & solutions and most importantly code snippets to help you integrate our system with known resources.
---

# rcore\_dispatch

{% embed url="" %}
**Showcase Video**
{% endembed %}

[**Buy Here**](https://store.rcore.cz)

<!-- [**Forum Post**]() -->

# Instalation guide

### Step 1 - Database

You just start the script, and database is going to be defined automatically.

### Step 2 - Configuration

Make sure to read the contents of the different files inside the config directory and configure all the stuff that's necessary for this resource to work correctly.

# Setup guide

1. Define startup order -> server.cfg
2. Start your server
3. When server is loaded with the dispatch, the resource will setup the environment automatically.
4. Have fun

* If you are using own framework: [check docs](https://documentation.rcore.cz/paid-resources/rcore_dispatch/framework#custom-framework)

# SCRIPT STARTUP ORDER:

NOTE: !!! Make sure that you are having correct script server order, and you are having this order after framework!!!

### Chat commands

All this commands can be eddited throught config.

| Command      | Params | Description     |
| :---        |    :----:   |          ---: |
| /911      | text |  Stuff to report   |
| /anon911   | text        | Stuff to report anonymously   |
| /sos   | text        | Accident to report     |
| /dispatch   | none        | Toggle the dispatch switchboard     |
| /panel   | none        | Open the dispatch panel     |
| /config_switch   | none        |  Open the dispatch config  |
