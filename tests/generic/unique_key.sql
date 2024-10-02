{% test unique_key(model, columns)%}
    select
    {% for column_name in columns %}
        "{{ column_name }}"::text {% if not loop.last %}||{% endif %}
    {% endfor %}
    from
        {{ model }}
    group by
        1
    having
        count(*) > 1
{% endtest %}