# reveal.js self contained presentation generator

## Installation

  1. *Optional:* adapt presentation.html.j2 to your needs (css theme, revealjs-plugins, ...)
  2. Generate *presentation.html*

    ```
    $ ./create_presentation.sh
    ```

This will create a *presentation.html* file containing [revealjs](https://revealjs.com) which loads the presentation content from *markdown.md* file.

## Usage

  1. Copy the presentation.html into a new folder
  3. Edit/create a *markdown.md* file containing presentation content (see [https://revealjs.com/markdown](https://revealjs.com/markdown) )
  3. Start presentation

    ```
    $ python -m http.server 8080 & xdg-open http://localhost:8080
    ```


