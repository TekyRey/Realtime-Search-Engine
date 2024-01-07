# Real-time Search box

> Welcome to the Real-time Search Engine project! This application provides a real-time search experience with insightful analytics on the most frequently searched terms.

## Overview

This project is realtime search engine built with `ruby on rails` and in order to manage the realtime page load I implement the `Turbo_Frames` features linked with `Stimulus Js`.

## Live Link

[Live Link](https://afternoon-chamber-81037-211f2e61f0cf.herokuapp.com)

## Modules

This project consists of the following modules:

### Search

The search module is responsible for providing a real-time search experience to the users. It utilizes the `Turbo_Frames` feature linked with `Stimulus Js` to manage the realtime page load. Users can enter search terms and instantly see the results without refreshing the page.

### Analytics

The analytics module provides insightful analytics on the most frequently searched terms. It tracks and analyzes user search behavior to identify popular search terms and trends. This information can be used to make data-driven decisions and improve the search functionality of the application.

## Built With

- Ruby on Rails
- Turbo_frames
- Postgresql
- stimulus
- Rspec

## Getting Started

To run this project locally, follow these simple steps:

```bash
git clone git@github.com:TekyRey/Realtime-Search-Engine.git
cd Realtime-Search-Engine
```

### Prerequisites

Ensure that the following are installed on your computer:

- `Ruby 3.1.2`
- `Rails 7.0.4`
- `PostgreSQL (any version)`

### Setup

Install gems with:

```bash
bundle install
```

Create a .env file at the root of your project to store your database credentials.

```sh
touch .env
```

`.env` file content

```ruby
DATABASE_USERNAME=your_username i.e postgres
DATABASE_PASSWORD=your_database_password
```

Set up the database:

```bash
rails db:setup
rails db:migrate
rails db:seed
```

Start the server

```bash
rails s
```

Open [http://localhost:3000/](http://localhost:3000/]) in your browser.

### Run

Execute the following command to run tests:

```bash
bundle exec rspec
```

## Author

👤 **Rehema Mwaka Baya**

- GitHub: [@TekyRey](https://github.com/TekyRey)
- Linkedin: [@Rehema Mwaka](https://www.linkedin.com/in/rehema-mwaka-48a1801ab/)

### 🔭 The Pyramid Problem

```bash
    In the ArticlesController, the implemented solution focuses on efficient search handling and analytics tracking.
    Here's a concise overview:

    User Session Handling:
    Retrieve or create a user session based on the session ID to track user-specific information.

    Search Query Processing:
    Sanitize and perform a search in the Article model based on the query.

    Determining if the Search Should be Saved:
    Check criteria before saving a search, including query length, difference from the last search, and elapsed time.

    Saving Search After Delay:
    Update session attributes and use a delayed thread to save the search, accommodating users who are still typing.

    Analytics Tracking:
    Create or update Analytic records for words longer than 2 characters to track their occurrence.

    This solution ensures efficient handling of searches, prevents redundant saves, and tracks word occurrences for analytics.

    Note that for similar searches made in different requests, both will be saved, so results similar to those expected from a pyramid problem will be recorded. An example of this can be seen in the image below, where one person has searched for "a passag" and another has searched for "a passage", leading to the recording of very similar results. This could perhaps be an interesting problem to solve in a further development of the solution.
```

## App Images

![Local Image](/search.png)
![Local Image](/analytics.png)
![Local Image](/analytics1.png)


### 🤝 Contributing

Contributions, issues, and feature requests are welcome! Check the [issues page](../../issues/) for opportunities to contribute.

## Acknowledgments

🤝 [HelpJuice](https://www.Helpjuice.com)

## 📝 License

This project is MIT licensed.
