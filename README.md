# XM Cloud Starter Kit (With SXA and Next JS)

## QUICK START

1. In an ADMIN terminal:

    ```ps1
    .\init.ps1 -InitEnv -LicenseXmlPath "C:\path\to\license.xml" -AdminPassword "DesiredAdminPassword"
    ```

2. Restart your terminal and run:

    ```ps1
    .\up.ps1
    ```

3. Deploy to XM Cloud

4. Create Edge token and query from edge

5. Deploy to Vercel

*** 

## About this Solution

This solution is designed to help developers learn and get started quickly with XMCLoud + SXA.

It is done from a default Foundation Head staterkit, plus I added useful features to is above the default:

- authoring API that creates a Media item out of an image from a local drive
- authenication and other security/token scripts to be re-used by other scripts, that reliy on `user.json` file
- enablement of SPE module and its remoting (including the Win PS module itself within `SPE.zip`)
- sample of operable XDT transform
- a basic example of customization (Expander/Collapser for Content Editor)
- build and deploy scripts
- deployment to Vercel script

