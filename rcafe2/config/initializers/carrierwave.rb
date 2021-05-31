# Allow non-ascii letters in uploaded filenames
# 한글 파일명 깨짐 방지를 위한 예외처리
CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/