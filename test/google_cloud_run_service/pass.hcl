mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-cloud-run-service-pass.mock"
  }
}

test {
    rules = {
        main = true
    }
}