<cfparam name="args.hidden" default="">
<cfparam name="args.id" default="">
<cfparam name="args.label" default="">
<cfparam name="args.name" default="">
<cfparam name="args.value" default="">
<cfparam name="args.min" default="">
<cfparam name="args.max" default="">
<cfparam name="args.step" default="">
<cfparam name="args.fieldDescription" default="">

<cfoutput>
	<!--- <div class="form-group marginTop25"> --->
		<cfif args.hidden neq "true">
			<label for="#args.id#">#args.label#: </label>
		</cfif>

		<input type="number"
			name="#args.name#"
			id="#args.id#"
			value="#args.value#"
			<cfif isNumeric( args.min )>
				min="#args.min#"
			</cfif>
			<cfif isNumeric( args.max )>
				max="#args.max#"
			</cfif>
			<cfif isNumeric( args.step )>
				step="#args.step#"
			</cfif>
			class="form-control"/>
		<cfif len( args.fieldDescription )>
			<span id="helpBlock" class="help-block">#args.fieldDescription#</span>
		</cfif>
		<!--- </div> --->
</cfoutput>