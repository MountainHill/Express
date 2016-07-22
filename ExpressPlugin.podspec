Pod::Spec.new do |s|
  s.name     = 'ExpressPlugin'
  s.version  = '0.0.1'
  s.license  = 'MIT'
  s.summary  = 'query express tracks'
  s.homepage = 'https://github.com/MountainHill/Express'
  s.authors  = { 'MountainHill' => '630964507@qq.com' }
  s.source   = { :git => 'https://github.com/MountainHill/Express/ExpressPlugin/ExpressPlugin' }
  s.requires_arc = true
  
  s.public_header_files = 'RRBExpressCompanyCode.h','RRBExpress.h','RRBExpressOrder.h'
  s.source_files = 'RRBExpressCompanyCode.h','RRBExpress.h','RRBExpressOrder.h','RRBExpress.m','RRBExpressOrder.m'
  
end
