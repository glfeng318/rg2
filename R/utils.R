# convert data.frame to json for treemap
# the N-1 column are group-column, the last column is value column.
df2treemap_json <- function(df) {
  entries = c()
  # Stopping case
  if (dim(df)[2] == 2) {  # only 2 columns left
    for (i in 1:dim(df)[1]){
      entries = append(entries, list(list(name=df[i, 1], value=df[i, 2])))
    }
    #entries = jsonlite::toJSON(df)
  } else { # Iterating case
    values = unique(df[,1])  # Getting unique values of the first column
    for (v in values) {
      df_next = subset(df, df[, 1] == v, select = -1)
      entries = append(entries, 
                       list(list("name"=v,
                            "color"=v,
                            "value"=sum(subset(df_next, select = ncol(df_next))),
                            # reiterating the process but without the first column
                            # and only the rows with the current value
                            "children"=df2treemap_json(df_next)
                       )))
    }
  }
  entries
}
