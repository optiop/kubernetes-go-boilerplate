data "aws_route53_zone" "web_page" {
  name         = var.web_page
  private_zone = false
}

resource "aws_route53_record" "validation_route53_record" {
  for_each = {
    for dvo in aws_acm_certificate.acm_certificate.domain_validation_options : dvo.domain_name => {
      name   = dvo.resource_record_name
      record = dvo.resource_record_value
      type   = dvo.resource_record_type
    }
  }

  allow_overwrite = true
  name            = each.value.name
  records         = [each.value.record]
  ttl             = 60
  type            = each.value.type
  zone_id         = data.aws_route53_zone.web_page.zone_id
}

resource "aws_route53_record" "web_page_cname" {
  zone_id = data.aws_route53_zone.web_page.zone_id
  name    =  "amazon.lb.com" // URL of the load balancer
  type    = "A"

  alias {
    name                   = aws_cloudfront_distribution.distribution.domain_name
    zone_id                = aws_cloudfront_distribution.distribution.hosted_zone_id
    evaluate_target_health = true
  }
}
