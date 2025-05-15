#!/bin/env perl

while ( <> ){
  chomp;
  m|t/(\w+)|; # extract image id
  print '<a href="/img/', $1, '">';
  print '<img src="https://s.tim-brown.org.uk/', $_, '">';
  print "</a>\n";
}
