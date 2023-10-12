<img src="img/logo_ceno.png" width=250px alt="Ceno Browser logo">

This is the website for [Ceno Browser](https://censorship.no) - a web browser designed to circumvent censorship by routing traffic through intermediate ephemeral nodes (bridges).

Once the content is in the censored zone - and if it's not private - it is then further distributed by those nodes in a BitTorrent-like fashion.

## Local Development

This website is hosted by GitHub Pages and content is authored in HTML.

1. Clone the repository:

    `git clone git@gitlab.com:censorship-no/ceno-website.git`

2. Install dependencies for i18n support:

    You will need [Translate Toolkit](https://toolkit.translatehouse.org/) and [gettext](https://www.gnu.org/software/gettext/).

    On a Debian-based system, install these with:
    - `sudo apt update`
    - `sudo apt install translate-toolkit gettext`

3. In the `ceno-website` `master` branch, update HTML files in `en.src` only (page-specific content or common head & tail). **Never edit files in `en` or other languages' directories.**  

     If you need to check how the English site would look, run `./html-assemble-en.sh`, open the pages and then restore `en/*.html`.

    **Do not create new Weblate components yet** as their translations may get lost after POT extraction and PO update below.

4. If updating **only the Ceno download link**, use the following command:

    `./git-update-download.sh VERSION DATE`

    where `VERSION` and `DATE` match the latest apk found on the [dComms server](https://dcomm.net.ua/package/ceno/), e.g. for v2.0.0:

    `./git-update-download.sh 2.0.0 2023-01-26_1701`

5. On translation freeze, assemble the i18n files:

    `./git-assemble.sh`

    This automates the following steps:
 
    - `no-ff-merge origin/master` into `i18n`.
    - In `i18n`, run `./html-assemble-en.sh`, then `./pot-extract.sh`, then `./po-update.sh`; commit each step (if it produces changes)

6. Push to `origin/i18n`:

    `git push origin i18n`

7. (Optional) Create new components in [Weblate](https://hosted.weblate.org/projects/censorship-no/) if any; this will take care of adding new PO files.

8. New translations create a Gitlab merge request to the `i18n` branch. **Approve the merge request in Gitlab before the next steps.**

9. **If adding a new language**, `touch` its `index.html` file before executing the next step.

10. When satisfied with translations, update the html for all languages, commit & push to `origin/i18n`: 

    - `./html-update-all.sh`
    - `git add -A && git commit -m "updating html with new changes"`
    - `git push origin i18n`

11. No-ff-merge `origin/i18n` into `master` and push to `origin/master`:

    - `git checkout master`
    - `git merge --no-ff origin/i18n`
    - `git push origin master`

Now the website will be automatically updated by the Github CI/CD located at https://github.com/censorship-no/ceno.github.io!

## Additional Resources

- [Ceno Browser Branding & Style Guide](https://censorship.no/en/branding.html)
- [Ceno Browser project on Weblate](https://hosted.weblate.org/projects/censorship-no/)

## License

This source code is subject to the terms of the [Creative Commons Attribution-ShareAlike 4.0 International License](LICENSE.md).

## Feedback

We welcome both positive and negative feedback, bug reports and feature requests, as well as questions at support@censorship.no.
Our PGP key fingerprint is: 51BE 600C 2711 926C 865D F93F C7DC C123 F0DD B862
