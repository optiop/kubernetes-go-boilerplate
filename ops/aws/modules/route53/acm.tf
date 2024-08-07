resource "aws_acm_certificate" "acm_certificate" {
  provider          = aws.virginia
  domain_name       = var.url_address
  validation_method = "DNS"
  tags              = var.tags

  lifecycle {
    create_before_destroy = true
  }
}

resource "aws_acm_certificate_validation" "web_page" {
  provider                = aws.virginia
  certificate_arn         = aws_acm_certificate.acm_certificate.arn
  validation_record_fqdns = [for record in aws_route53_record.validation_route53_record : record.fqdn]
}