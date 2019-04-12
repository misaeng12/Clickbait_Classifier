### Extracting Clickbaits using Comments ###

hoax.index <- sort(unique(c( grep("낚", news$best_comment), grep("낚", news$none_best_comment),
                             grep("기레기", news$best_comment), grep("기레기", news$none_best_comment) )))

news$hoax <- 0; news$hoax[ hoax.index ] <- 1
nrow(news); sum(news$hoax)
write.csv(news_labeled, "news(2008-2011).csv", fileEncoding="euc-kr")

hoax <- news[ hoax.index , ]
write.csv(hoax, "hoax(2008-2011).csv", fileEncoding="euc-kr")

news1 <- news[news$cateogory=="스포츠" | news$cateogory=="연예", ]
hoax1 <- hoax[hoax$cateogory=="스포츠" | hoax$cateogory=="연예", ]

nrow(news1); nrow(hoax1)
write.csv(hoax1, "hoax1(2008-2011).csv", fileEncoding="euc-kr")
