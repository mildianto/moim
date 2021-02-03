resource "aws_key_pair" "moim-app-key" {
  key_name   = "moim-app-key"
  public_key = file(var.path_to_moim_public_key)
}
