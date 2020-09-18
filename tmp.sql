select channels.id, count(comments.id) 
from  (channels left join comments on channels.id=comments.channel_id 
where channels.parent_channel_id is null) left j
group by channels.id;

select com_count.id, name, abstract, num_of_comments, num_of_events
from (
    select channels.id id, channels.name, channels.abstract, count(comments.id) num_of_comments
    from channels left join comments on channels.id=comments.channel_id
    where channels.parent_channel_id is null
    group by channels.id
) com_count join (
    select channels.id, count(events.id) num_of_events
    from channels left join events on channels.id=events.channel_id
    where channels.parent_channel_id is null
    group by channels.id
) eve_count
on com_count.id = eve_count.id;
