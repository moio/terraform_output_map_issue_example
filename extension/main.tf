variable "configuration" {
  type = "map"
}

resource "aws_instance" "example" {
  ami           = "ami-0d729a60"
  instance_type = "t2.micro"
  
  tags {
    Name = "Extension of ${var.configuration["base_instance_id"]}"
  }
}

output "configuration" {
  value {
    param1 = "${var.configuration["param1"]}"
    extension_instance_id = "${aws_instance.example.id}"
  }
}
