#!/bin/#!/usr/bin/env bash

echo "Starting up frontend..."

cd client
sed sed -i "s/''/$TMDB_KEY/" src/config.js
npm start
