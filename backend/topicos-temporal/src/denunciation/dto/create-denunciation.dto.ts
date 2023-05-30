import { IsNumber, IsString, IsUUID, MaxLength, MinLength } from "class-validator";

export class CreateDenunciationDto {
  @IsString()
  @MinLength(60)
  @MaxLength(512)
  description: string;

  @IsString()
  images: string;
  
  @IsString()
  location: string;
  
  @IsUUID()
  neighbor_id: string; 
  
  @IsNumber()
  type_denunciation_id: number;
}
