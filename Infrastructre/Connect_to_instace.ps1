# Purpose of this script is to help the user connect to their google cloud instance


instance_id=$(terraform output instance_id)
project_id=$(terraform output project_id)

gcloud compute ssh ${instance_id} --project ${project_id}