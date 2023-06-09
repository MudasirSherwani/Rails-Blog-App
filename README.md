<a name="readme-top"></a>

<div align="center">

  <h3><b>Rails Blog App</b></h3>

</div>

<!-- TABLE OF CONTENTS -->

# 📗 Table of Contents

- [📖 About the Project](#about-project)
  - [🛠 Built With](#built-with)
    - [Tech Stack](#tech-stack)
    - [Key Features](#key-features)
  - [🚀 Live Demo](#live-demo)
- [💻 Getting Started](#getting-started)
  - [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Install](#install)
  - [Usage](#usage)
  - [Run tests](#run-tests)
  - [Deployment](#triangular_flag_on_post-deployment)
- [👥 Authors](#authors)
- [🔭 Future Features](#future-features)
- [🤝 Contributing](#contributing)
- [⭐️ Show your support](#support)
- [🙏 Acknowledgements](#acknowledgements)
- [📝 License](#license)

<!-- PROJECT DESCRIPTION -->

# 📖 Rails Blog App <a name="about-project"></a>

>The Blog app is a classic example of a blog website. I have created a fully functional website that will show the list of posts and empower readers to interact with them by adding comments and liking posts.

> ### 📖 Rails Blog App : Creating a data model.
> In this section of project, I have used migration files to build your schema.

> ### 📖 Rails Blog App : Processing data in models.
> In this section of project, I have set up models. To start with, we have tables for Users, Posts, Comments, and Likes, which means we need a model for each one. We've already set the foreign key in the table schema but be sure to write it here too!

> ### 📖 Rails Blog App : Validations and model specs.
> In this section of project, I have added validations to the models and create specs for them.

> ### 📖 Rails Blog App : Controllers
> In this section of project, I have created all controllers and views for your Blog app. I didn't process any data yet, I have also add simple placeholders for views with plain HTML.

> ### 📖 Rails Blog App : Controllers specs
> In this section of project, I have set up tests on the controllers recently added to the Blog app.

> ### 📖 Rails Blog App : Views
> In this section of project, I have added the Views associated with the Models and Controllers which I have already created for this Blog App.

> ### 📖 Rails Blog App : Add Forms
> In this section of project, I have added the forms for create new post and add comments in the rails Blog App.

> ### 📖 Rails Blog App : Integration specs for Views and fixing n+1 problems.
> In this section of project, I have create integration tests for all of the views used in the project. Be sure to cover the user stories (or user workflows) that you want users to experience while taking into consideration the possible errors your users may cause.

> ### 📖 Rails Blog App : Add Devise.
> In this section of project, In this project, I have added the devise gem to the app and use it for the registration and login of users.

> ### 📖 Rails Blog App : Add authorization rules.
> In this section of project, We have added authorization to the app using CanCanCan.

> ### 📖 Rails Blog App : Add API endpoints.
> In this section of project, We have added some API endpoints to the Blog app. This will allow this app to be used in different ways, rather than just through your site - for example, a mobile app or a CLI application.


## 🛠 Built With <a name="built-with"></a>

### Tech Stack <a name="tech-stack"></a>

<details>
  <summary>BackEnd</summary>
  <ul>
    <li><a href="https://railsguide.com/">Rails</a></li>
  </ul>
</details>

<details>
  <summary>Test</summary>
  <ul>
    <li><a href="https://rspec.com/">RSPEC</a></li>
  </ul>
</details>

<details>
<summary>Database</summary>
  <ul>
    <li><a href="https://www.postgresql.org/">PostgreSQL</a></li>
  </ul>
</details>

<!-- Features -->

### Key Features <a name="key-features"></a>

- **Creating a data model.**
- **Validations and Model specs.**
- **Processing data in models.**
- **Setup and controllers.**
- **Controllers specs.**
- **Views.**
- **Forms.**
- **Integration specs for Views and fixing n+1 problems.**
- **Add Devise.**
- **Add authorization rules.**
- **Add API endpoints.**
- **API documentation.**

<p align="right">(<a href="#readme-top">back to top</a>)</p>


## 💻 Getting Started <a name="getting-started"></a>

To get a local copy up and running, follow these steps.

### Prerequisites

In order to run this project you need:

- Ruby on Rail Knowledge
- Object Oriented Programming(OOP) Knowledge
- Vs Code 
- Github / Git Bash
- install ruby

```sh
 sudo apt-get install ruby-full

```
- install rails
  
  ```sh
    gem install rails

  ```
- Install gems of rails

  ```sh
    bundle install
  ```

- install postgresql
  
  ```sh
    sudo apt-get install postgresql postgresql-contrib libpq-dev
  ```

### Setup

Clone this repository to your desired folder:

```sh
  git clone git@github.com:MudasirSherwani/Rails-Blog-App.git
  cd Rails-Blog-App
```

Prepare the database:
  - create database

```sh
  rails db:create
  rails db:migrate
```

### Usage

To run the project, execute the following command:

```sh
  rails server
```


### Run tests

To run tests, run the following command:

```sh
  Rspec
```

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- AUTHORS -->

## 👥 Authors <a name="authors"></a>

👤 **Mudasir Sherwani**

- GitHub: [@Mudasir Sherwani](https://github.com/MudasirSherwani)
- Twitter: [@Mudasir Sherwani](https://twitter.com/mudasirsherwani)
- LinkedIn: [@Mudasir Sherwani](https://linkedin.com/in/mudasir-sherwani)


👤 **Pierre Celestin Moussa**

- GitHub:[@Piercel2022 Pierre](https://github.com/Piercel2022)
- Twitter:[@pier_celestin Pierre](https://twitter.com/pier_celestin)
- LinkedIn: [@pierrecelestinmax Pierre](https://linkedin.com/in/pierrecelestinmax)

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- FUTURE FEATURES -->

## 🔭 Future Features <a name="future-features"></a>

- **REST Full API**

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- CONTRIBUTING -->

## 🤝 Contributing <a name="contributing"></a>

Contributions, issues, and feature requests are welcome!

Feel free to check the [issues page](https://github.com/MudasirSherwani/Rails-Blog-App/issues).

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- SUPPORT -->

## ⭐️ Show your support <a name="support"></a>

If you like this project give me a star.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- ACKNOWLEDGEMENTS -->

## 🙏 Acknowledgments <a name="acknowledgements"></a>

I would like to thanks [Microverse](https://www.microverse.org/) to guide me to complete this project.

<p align="right">(<a href="#readme-top">back to top</a>)</p>

<!-- LICENSE -->

## 📝 License <a name="license"></a>
 
This project is [MIT](https://github.com/MudasirSherwani/Rails-Blog-App/blob/main/LICENSE) licensed.


<p align="right">(<a href="#readme-top">back to top</a>)</p>
