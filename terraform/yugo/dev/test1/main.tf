resource "aws_sns_topic" "user_updates" {

  name = "test1"
  tags = {
    name = "test"
  }
}