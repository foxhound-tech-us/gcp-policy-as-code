mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-cloud-run-service-fail.sentinel"
  }
}

test {
    rules = {
        main = false
    }
}