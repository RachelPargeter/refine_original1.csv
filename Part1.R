library(dplyr)


library(readxl)    
refine_df <- read_excel("refine.xlsx") %>% 
  arrange(company)
colnames(refine_df) <- make.names(colnames(refine_df))
refine_df$company[8:16] <-"philips"
refine_df$company[1:7] <- "akzo"

refine_df$company[21:25] <-"van houten"
refine_df$company[17:20] <-"unilever"
library(tidyr)

products <- c(p = "Smartphone", v = "TV", x = "Laptop", q = "Tablet")
refine_df <-refine_df %>% separate(Product.code...number., c("product_code", "product_number")) %>% 
  mutate(product_category = products[product_code])

library(dplyr)


refine_df <-refine_df %>% unite(full_address, address, city, country, sep = ",")

                          
 

  
# refine_df$product_category <- products[refine_df$product_code]
company_mat <- model.matrix(~ company + 0L, data = refine_df)

class(company_mat)

refine_df <- refine_df %>% bind_cols(as.data.frame(company_mat))

# refine_df <- bind_cols(refine_df,as.data.frame(company_mat))  (also good, but does not have the pipe operator)

# refine_df <-as.data.frame(company_mat) %>% bind_cols(refine_df) (flipped result, nothing really happened)

  







