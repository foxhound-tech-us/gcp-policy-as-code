mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-cloud-run-service-fail.mock"
  }
}

test {
    rules = {
        main = false
    }
}