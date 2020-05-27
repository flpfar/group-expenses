# Group Expenses
 > A simple way of grouping expenses from different users, built on Ruby on Rails.

![screenshot](https://user-images.githubusercontent.com/15898299/83020347-bbd48c80-9ffe-11ea-86d5-2cdfa1ff5a04.png)

This simple app allows you to group your expenses with other users and shows the total of each group. The groups are shared globally, meaning that any registered user can see and add new expenses inside a group.
The interface aims at mobile phones, so there may be design issues on desktop version.

## Features
- Sign up and login with a username (no password required)
- Create new groups and new expenses
- List available groups
- List expenses: all my expenses, my expenses without groups and all grouped expenses

## Built With

- Ruby (version 2.6.5)
- Ruby on Rails (version 5.2.4)
- Rspec, Capybara, DatabaseCleaner and FactoryBot for testing
- Postgres as database
- HTML5, CSS3, Bootstrap and Javascript in frontend
- Rubocop as linter

## How to Install

- Install Ruby in your system. To install Ruby, you can read the [Documentation](https://www.ruby-lang.org/en/documentation/installation/).
- Install Rails. You can read this [page](https://www.theodinproject.com/courses/ruby-on-rails/lessons/your-first-rails-application-ruby-on-rails).

- Clone it using **git clone** command.
- Inside the project folder, run the following commands in terminal:
```
$ bundle install
$ rails db:migrate
$ rails server
```

## Automated Test

- This project uses RSpec and Capybara for unit and integration testing. In order to run the tests, in terminal, type: ```rspec```

## Future improvements and fixes
- Allow user to chose profile image
- Show message when there are no expenses or groups
- Interface improvements like links to previous path on everypage 
- Edit and delete transactions

## Authors

👤 **Felipe Augusto Rosa**

- Github: [@flpfar](https://github.com/flpfar)
- Twitter: [@flpfar](https://twitter.com/flpfar)
- Linkedin: [Felipe Augusto Rosa](https://www.linkedin.com/in/felipe-augusto-rosa/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!. Feel free to check the [issues page](https://github.com/flpfar/group-expenses/issues).

## Show your support

Give a ⭐️ if you like this project!

## 📝 License

This project is [MIT](LICENSE) licensed.