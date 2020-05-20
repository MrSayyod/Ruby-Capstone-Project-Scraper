[![hire-badge](https://img.shields.io/badge/Consult%2FHire%20Sayyod-Contact%20with%20Sayyod-brightgreen)](mailto:ssayyod@gmail.com)[![Twitter Follow](https://img.shields.io/twitter/follow/sayyodsaidov?label=Follow%20Sayyod%20on%20Twitter&style=social)](https://twitter.com/sayyodsaidov)


# Ruby-Capstone-Project-Scraper
Ruby Capstone Project - Scraper (created by Sayyod Saidov) [solo project]

# Web Scraping
## Definition 
Web scraping, web harvesting, or web data extraction is data scraping used for extracting data from websites. Web scraping software may access the World Wide Web directly using the Hypertext Transfer Protocol, or through a web browser. While web scraping can be done manually by a software user, the term typically refers to automated processes implemented using a bot or web crawler. It is a form of copying, in which specific data is gathered and copied from the web, typically into a central local database or spreadsheet, for later retrieval or analysis.


## Techniques 
Web scraping is the process of automatically mining data or collecting information from the World Wide Web. It is a field with active developments sharing a common goal with the semantic web vision, an ambitious initiative that still requires breakthroughs in text processing, semantic understanding, artificial intelligence and human-computer interactions. Current web scraping solutions range from the ad-hoc, requiring human effort, to fully automated systems that are able to convert entire web sites into structured information, with limitations.

# About Project
The purpose of this project is to develop an scraper tool to achieve web-scrapping. This was achieved using Ruby, Open-uri and Nokogiri gem. Byebug debugger is used to check the values of the scrapped data from the page. 
In this project, I created a scraper which extracts job advertisements for junior web developers from the [Simplyhired.com](https://www.simplyhired.com). There are more than 2000 results, so I decided to stop scraper after displaying page 10. If you want more results open `scraper.rb` and change the `line 49`.

# Built With
 - Ruby 2.7.1
 - Nokogiri 1.11.0.rc2
 - Open-uri
 - Byebug 11.1.3
 - RSpec 3.9
 - Rubocop 0.81.0
 - VSCode editor 1.45.1

# Getting Started
To get started, you should first get this file in your local machine by downloading this project or typing.
`
git clone https://github.com/MrSayyod/Ruby-Capstone-Project-Scraper.git
`

## Prerequisites
    Ruby installed on local machine
    Text editor (preferably: VSCode, Atom, Sublime)
    Git

## Setup
   If you have installed `Ruby` on your machine:
   Clone the project into your local machine using `git clone` command or download the zip file.
   Go into the project directory using `cd directory name` command.
   Run `bundle install` to install the Gemfiles or install required gems by using `gem install <gem name>` 
   From the root directory type `bin/main.rb` command.
   After the project has fetched all the data from the website. It will hit the byebug debugger.
   Also run command `list[any number you want]` to display the job advertisement for example.
   Run command `exit` in the terminal to exit the `byebug`.
   Run `CTRL + C` to terminate the session while extracting data.
   Run command `rspec <file name>` to test the various methods in the classes.
   

# Contributing

:handshake: Contributions, issues and feature requests are welcome! 
Start by:

    Forking the project
    Cloning the project to your local machine
    cd into the project directory
    Run git checkout -b your-branch-name
    Make your contributions
    Push your branch up to your forked repository
    Open a Pull Request with a detailed description to the development branch of the original project for a review

Please feel free to contribute to any of these!

Feel free to check the [issues page](https://github.com/MrSayyod/Ruby-Capstone-Project-Scraper/issues).

# Authors

:man_technologist: Sayyod Saidov

- Email: ssayyod@gmail.com
- Github: [@MrSayyod](https://github.com/MrSayyod) 
- LinkedIn:  [Sayyod Saidov](https://www.linkedin.com/in/sayyod-saidov-507b0818b)
- Twitter: [Sayyod Saidov](https://twitter.com/sayyodsaidov)
- Facebook: [Sayyod Saidov](https://www.facebook.com/sayyod)

# Show your support!

Give a :star2: if you like this project! :blush:

📝 Copyright

## Acknowledgments

> - [Microverse](https://www.microverse.org/)
> - [Rubocop](https://docs.rubocop.org/en/stable/)
> - [Nokogiri](https://nokogiri.org/)

# 📝 License

This project is [MIT](LICENSE.md) licensed

Happy coding!
