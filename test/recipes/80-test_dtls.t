#! /usr/bin/env perl
# Copyright 2015-2016 The OpenSSL Project Authors. All Rights Reserved.
#
# Licensed under the OpenSSL license (the "License").  You may not use
# this file except in compliance with the License.  You can obtain a copy
# in the file LICENSE in the source distribution or at
# https://www.openssl.org/source/license.html

use OpenSSL::Test::Utils;
use OpenSSL::Test qw/:DEFAULT srctop_file/;

setup("test_dtls");

plan skip_all => "No DTLS protocols are supported by this OpenSSL build"
    if alldisabled(available_protocols("dtls"));

plan tests => 1;

# this runs test/dtlstest.c, which creates an ssl_ctx_pair to connect
# the DTLS_server_method to DTLS_client_method and see how it interacts with
# itself.

ok(run(test(["dtlstest", srctop_file("apps", "server.pem"),
             srctop_file("apps", "server.pem")])), "running dtlstest");
