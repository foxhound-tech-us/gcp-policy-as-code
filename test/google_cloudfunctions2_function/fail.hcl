mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-cloudfunctions2-function-fail.mock"
  }
}

test {
    rules = {
        main = false
    }
}