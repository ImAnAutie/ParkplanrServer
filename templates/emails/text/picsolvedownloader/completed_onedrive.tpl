{config_load file="smarty.conf"}
Hi there {$user.name}

We have finished saving all of your Picsolve photos to Onedrive

https://onedrive.live.com/?id={$folder}

{$new_count} photos were saved.

{if $failed_image_count ne 0}
	Unfortunately {$failed_image_count} photos could not be saved due to an error on Picsolves system.
{/if}


{include file="emails/text/footer.tpl"}
