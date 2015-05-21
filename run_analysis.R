
library("data.table")
library("reshape2")

activity_labels <- read.table("./UCI HAR Dataset/activity_labels.txt")[,2]
features <- read.table("./UCI HAR Dataset/features.txt")[,2]

get_feature <- grepl("mean|std", features)

X_test <- read.table("./UCI HAR Dataset/test/X_test.txt")
y_test <- read.table("./UCI HAR Dataset/test/y_test.txt")
subject_test <- read.table("./UCI HAR Dataset/test/subject_test.txt")

names(X_test) = features
X_test = X_test[,get_feature]

y_test[,2] = activity_labels[y_test[,1]]
names(y_test) = c("Activity_ID", "Activity_Label")
names(subject_test) = "subject"

dados <- cbind(as.data.table(subject_test), y_test, X_test)

X_train <- read.table("./UCI HAR Dataset/train/X_train.txt")
y_train <- read.table("./UCI HAR Dataset/train/y_train.txt")
subject_train <- read.table("./UCI HAR Dataset/train/subject_train.txt")
names(X_train) = features

X_train = X_train[,get_feature]

y_train[,2] = activity_labels[y_train[,1]]
names(y_train) = c("Activity_ID", "Activity_Label")
names(subject_train) = "subject"

dados_train <- cbind(as.data.table(subject_train), y_train, X_train)

dados_geral = rbind(dados, dados_train)

rotulos_2   = c("subject", "Activity_ID", "Activity_Label")
rotulo_dados = setdiff(colnames(data), rotulos_2)
dados_melt      = melt(dados_geral, id = rotulos_2, measure.vars = rotulo_dados)

tidy_data   = dcast(dados_melt, subject + Activity_Label ~ variable, mean)

write.table(tidy_data, file = "./tidy_dataset.txt")
