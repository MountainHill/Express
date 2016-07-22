Pod::Spec.new do |s|
  s.name     = 'ExpressPlugin'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'query express tracks'
  s.homepage = 'https://github.com/MountainHill/Express'
  s.authors  = { 'MountainHill' => '630964507@qq.com' }
  s.source   = { :git => 'https://github.com/MountainHill/Express.git' }
  s.requires_arc = true
  
  s.public_header_files = 'ExpressPlugin/ExpressPlugin/RRBExpress.h','ExpressPlugin/ExpressPlugin/RRBExpressCompanyCode.h','ExpressPlugin/ExpressPlugin/RRBExpressOrder.h'
  s.source_files = 'ExpressPlugin/ExpressPlugin/RRBExpressCompanyCode.h','ExpressPlugin/ExpressPlugin/RRBExpress.h','ExpressPlugin/ExpressPlugin/RRBExpressOrder.h','ExpressPlugin/ExpressPlugin/RRBExpress.m','ExpressPlugin/ExpressPlugin/RRBExpressOrder.m'
  
end
