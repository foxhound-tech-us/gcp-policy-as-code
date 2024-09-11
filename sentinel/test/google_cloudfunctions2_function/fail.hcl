mock "tfplan/v2" {
  module {
    source = "../../testdata/mock-google-cloudfunctions2-function-fail.sentinel"
  }
}

test {
    rules = {
        main = false
    }
}