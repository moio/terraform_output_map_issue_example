variable "param1" {}

resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"
}

output "configuration" {
  value {
    param1 = "${var.param1}"
    base_instance_id = "${aws_instance.example.id}"
  }
}

// The following works:
/*output "configuration" {
  value = "${map(
    "param1", "${var.param1}",
    "base_instance_id", "${aws_instance.example.id}"
  )}"
}*/
