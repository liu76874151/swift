_structbody(context) ::= <<
<_constructor(context)>

<context.fields : { field |<_field(field)>}; separator="\n\n">
>>

_field(field) ::= <<
private <field.javaType> <field.javaName>;

<_annotation(field)>
public <field.javaType> <field.javaGetterName>() { return <field.javaName>; }

@ThriftField
public void <field.javaSetterName>(final <field.javaType> <field.javaName>) { this.<field.javaName> = <field.javaName>; }
>>

_constructor(element) ::= <<
public <element.javaName>() {
}
>>

_union_setter(field) ::= <<
@ThriftField
public void <field.javaSetterName>(final <field.javaType> <field.javaName>) {
    this.value = <field.javaName>;
    this.id = <field.id>;
    this.name = "<field.name>";
}
>>


_union_body(context) ::= <<

private Object value;
private int id = -1;
private String name;

public <context.javaName>() {
}

<context.fields : { field |<_union_setter(field)>}; separator="\n\n">
>>
