import { NavigationMixin, CurrentPageReference } from 'lightning/navigation';
import { registerListener, unregisterAllListeners } from 'c/pubsub';
import { loadStyle } from 'lightning/platformResourceLoader';
import { LightningElement, track, wire } from 'lwc';
import resources from '@salesforce/resourceUrl/accommodation_explorer';
import getAllAccommodations from '@salesforce/apex/AccommodationController.getAllAccommodations';

export default class AccommodationList extends NavigationMixin(LightningElement) {
    @track accommodations;

    @wire(CurrentPageReference) pageRef;

	async connectedCallback() {
        registerListener('accommodationListUpdate', this.handleAccommodationListUpdate, this);

        loadStyle(this, resources + '/style.css')

        const result = await Promise.all([
            getAllAccommodations()
        ])
        this.accommodations = result[0];
    }

    disconnectedCallback() {
		unregisterAllListeners(this);
	}

    handleAccommodationListUpdate(accommodations) {
        this.accommodations = accommodations;
    }
}