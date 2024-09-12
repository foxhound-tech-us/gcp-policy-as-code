mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-cloud-run-service-pass.sentinel"
  }
}

test {
    rules = {
        main = true
    }
}