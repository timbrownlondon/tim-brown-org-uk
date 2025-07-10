Here is the source for https://tim-brown.org.uk

- Utility and build scripts are in bin/
- Main build script is publish-image-pages.pl
- Requests for /img/<id> are rewritten to /page/<id>.html. See nginx config that is mainatined outside of this repo.
- Image metadata are maintained in img-data.psv (pipe separated).

