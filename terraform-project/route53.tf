data "aws_route53_zone" "kumarstack" {
  name = "kumarstack.com"
}

resource "aws_route53_record" "root" {
  zone_id = data.aws_route53_zone.kumarstack.zone_id
  name    = "kumarstack.com"
  type    = "A"

  alias {
    name                   = aws_lb.app_lb.dns_name
    zone_id                = aws_lb.app_lb.zone_id
    evaluate_target_health = true
  }
}
