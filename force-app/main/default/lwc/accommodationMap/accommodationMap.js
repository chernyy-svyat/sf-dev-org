import { LightningElement, track, wire } from 'lwc';
import { CurrentPageReference } from 'lightning/navigation';
import { registerListener, unregisterAllListeners } from 'c/pubsub';

export default class AccommodationMap extends LightningElement {
	@track markers = [];

    @wire(CurrentPageReference) pageRef;

	connectedCallback() {
		registerListener('accommodationListUpdate', this.handleAccommodationListUpdate, this);
    }

	disconnectedCallback() {
		unregisterAllListeners(this);
    }

	handleAccommodationListUpdate(accommodations) {
        this.markers = accommodations.map(acc => {
            return this._mapAccommodationToMarker(acc);
        });
    }

    _mapAccommodationToMarker(accommodation) {
        const {
            Location__Latitude__s: Latitude,
            Location__Longitude__s: Longitude,
            Name,
            Address__c
        } = accommodation;
        return {
            location: { Latitude, Longitude },
			title: Name,
			description: Address__c,
			icon: 'utility:world'
        }
    }
}