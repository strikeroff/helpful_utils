#!/bin/bash
rm pkg/*.gem
rake manifest && rake gem && gem install -l pkg/*.gem