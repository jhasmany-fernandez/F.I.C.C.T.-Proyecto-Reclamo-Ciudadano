import e from 'express';
import { Denunciation } from 'src/denunciation/entities/denunciation.entity';
import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';

@Entity('users')
export class Auth {
    @PrimaryGeneratedColumn('uuid')
    id: string;

    @Column('text')
    nombre: string;

    @Column('text')
    apellido: string;
    
    @Column('text')
    ci: string;

    @Column('text')
    direccion: string;
    
    @Column('text')
    telefono: string;
    
    @Column('text', { unique: true })
    correo: string;

    @Column('text')
    contrasenia: string;

    @Column('text')
    foto: string;

    @OneToMany(
      () => Denunciation,
      denunciation => denunciation.neighbor,
    )
    denunciations: Denunciation[];
}
