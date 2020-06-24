============

## terraform-aws-jenkins-docker-selenium-capybara-RSpec 2020 ##

## Project description ##
```
explore california is a travel company website that has over 100,000 visit per month 
(http://explorecalifornia.org/) and want to ship new features faster, safely & more reliably ?
How can DevOps fix this ?
Production deploys 100% automated through CI & CD pipelines. 
The CI pipeline into production builds the website on the fly & run unit tests before every 
pull request enters review. The CD pipeline deploys the website artifacts into AWS using terraform
a separate pipeline runs daily to merge the master branches from each dev team into an integration
environment that runs integration tests and report failures to each dev teams which makes testing easier.
All envorinoments are consistent thanks to Docker / Docker compose as devellopers can now use the same
libraries & tool chains as what's available in production.
```


## Learning objectives ##
```
* Writing a Dockerfile to run the website locally
* Using Docker Compose
* Testing the app with RSpec, Capybara, Selenium to talk to a real browser & test elements from it
* Writing Terraform code to deploy the website into an AWS s3 bucket to host the website
* Writing and running integration tests
* Writing a CI/CD pipeline with Jenkins that will build, test, and deploy the app.
* apply DevOps principles to a sample app for a travel booking company

```

## Technical stuff i've done to achieve this ##
```
* installed rspec, capybara, selenium-webdriver using a dockerfile then containerized the website using nginx
* created a docker-compose manifest & configured the below services / containers:
  - the website: configured the port it will serving on & start the website locally
  - Jenkins
  - awcli
  - terraform: to allow us to deploy the website onto a real env. (aws)
  - selenium: configured it for other containers to have access to it too
  - unit-tests: make the test available in the container
  - integration-tests
  
* configured a simple unit test using RSpec, Capybara & Selenium to show the website logo
* created an s3 bucket, confugured the bucket & iam policies then configured it to run as a website using terrafrom

* the website on the internet rathenr than testing locally.
* wrote terraform code  
* Used selenium, capybara & RSpec to write some units and integrations tests
* used terrafrom to deploy the working instance into the cloud
* wrote a CI/CD with jenkins to build, test & deploy the website

```

```
* Dockerfile: manifest that describe the image that the container will use
* RSpec: ruby based testing framework, its DSL declarative & easy to read / understand.
* Capybara: something that can spin up the website & uses a web driver to create a browser and 
            interact with the website e.g get the html of the website, run javascripts & test 
            different functionalities.
* Selenium: webdriver that spin up a real web browser and test it against whatever the web browser sees.
* Terrafrom: golang based tool that allow us to deploys any sort of infra into any sort of env
```
## unit tests results ##
```
[jenkins@olivier-linux-server devops-projects]$ docker-compose run --rm unit-tests
including Capybara::DSL in the global scope is not recommended!
/usr/local/bundle/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/driver.rb:39: warning: Using the last argument as keyword parameters is deprecated; maybe ** should be added to the call
/usr/local/bundle/gems/selenium-webdriver-3.142.7/lib/selenium/webdriver/remote/bridge.rb:44: warning: The called method `handshake' is defined here
.
Finished in 6.44 seconds (files took 2.8 seconds to load)
1 example, 0 failures
```
