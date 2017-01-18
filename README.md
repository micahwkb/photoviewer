# README

This is a pretty basic image viewer leveraging [500px's public API ](https://github.com/500px/api-documentation)

## Objectives
* Display top 100 best-rated photos from [500px.com](https://www.500px.com/popular) dynamically (excludes NSFW images)

## Project details
* Created using Rails v5.0.1

* [dotenv](https://github.com/bkeepers/dotenv) used for storing the consumer key (see .env-example)

## Get started
(assumes you have cloned this repo)

1. Sign in or register with 500px
2. From your profile settings, register an Application
3. Click 'See application details' and copy the Consumer Key
4. Create a `.env` file at the root of the project directory, copy in your Consumer Key using same naming/syntax as in `.env-example`
