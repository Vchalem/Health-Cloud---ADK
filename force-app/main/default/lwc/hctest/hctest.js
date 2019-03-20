import { LightningElement, api, wire } from 'lwc';
import { getRecord } from 'lightning/uiRecordApi';

const FIELDS = [
    'Contact.Name',
    'Contact.Email',
];


export default class hctest extends LightningElement {
    @api recordId;

    @wire(getRecord, { recordId: '$recordId', fields: FIELDS })
    contact;

    get name() {
        return this.contact.data.fields.Name.value;
    }
    get email() {
        return this.contact.data.fields.Email.value;
    }


    description = 'Quick Notes About this Contact!';


    

}