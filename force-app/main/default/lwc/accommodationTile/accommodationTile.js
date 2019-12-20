import { LightningElement, api } from 'lwc';
import { NavigationMixin } from 'lightning/navigation';
import ACCOMMODATION_OBJECT from '@salesforce/schema/Accommodation__c';

export default class AccommodationTile extends NavigationMixin(LightningElement) {
	@api accommodation;

    handleViewClick() {
        this[NavigationMixin.Navigate]({
            type: 'standard__recordPage',
            attributes: {
                recordId: this.accommodation.Id,
                objectApiName: ACCOMMODATION_OBJECT.objectApiName,
                actionName: 'view'
            }
        });
        // const selectEvent = new CustomEvent('accommodationView', {
        //     detail: this.accommodation.Id
        // });
        // this.dispatchEvent(selectEvent);
    }
}